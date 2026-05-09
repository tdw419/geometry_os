; DESCRIPTION: Composite: Draws a white line from (370, 90) to (269, 26) then Places a orange dot at position (29, 210) then Creates a red rectangular region at (113, 204) spanning 104 by 16 pixels.
; PLAN: r0=370(x1), r1=90(y1), r2=269(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=29(x), r6=210(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=113(x), r11=204(y), r12=104(width), r13=16(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 90
LDI r2, 269
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 210
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 113
LDI r11, 204
LDI r12, 104
LDI r13, 16
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
