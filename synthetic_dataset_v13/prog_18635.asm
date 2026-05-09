; DESCRIPTION: Composite: Places a purple 116x26 rectangle at position (105, 145) then Places a white line segment connecting (420, 250) to (13, 3) then Places a orange circle of radius 49 at center (261, 191).
; PLAN: r0=105(x), r1=145(y), r2=116(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=420(x1), r6=250(y1), r7=13(x2), r8=3(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=261(x), r11=191(y), r12=49(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 105
LDI r1, 145
LDI r2, 116
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 250
LDI r7, 13
LDI r8, 3
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 191
LDI r12, 49
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
