; DESCRIPTION: Composite: Draws a green line from (310, 107) to (499, 167) then Places a red dot at position (191, 163) then Renders a white box of size 78x104 starting at (210, 74).
; PLAN: r0=310(x1), r1=107(y1), r2=499(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=163(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=210(x), r11=74(y), r12=78(width), r13=104(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 107
LDI r2, 499
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 163
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 210
LDI r11, 74
LDI r12, 78
LDI r13, 104
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
