; DESCRIPTION: Composite: Draws a red line from (21, 178) to (166, 67) then Places a black dot at position (465, 152) then Renders a orange box of size 104x26 starting at (153, 174).
; PLAN: r0=21(x1), r1=178(y1), r2=166(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=465(x), r6=152(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=153(x), r11=174(y), r12=104(width), r13=26(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 21
LDI r1, 178
LDI r2, 166
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 152
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 153
LDI r11, 174
LDI r12, 104
LDI r13, 26
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
