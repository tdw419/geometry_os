; DESCRIPTION: Composite: Places a purple line segment connecting (0, 83) to (352, 161) then Places a blue 33x75 rectangle at position (69, 83) then Places a yellow circle of radius 73 at center (145, 100).
; PLAN: r0=0(x1), r1=83(y1), r2=352(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=69(x), r6=83(y), r7=33(width), r8=75(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=145(x), r11=100(y), r12=73(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 0
LDI r1, 83
LDI r2, 352
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 83
LDI r7, 33
LDI r8, 75
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 100
LDI r12, 73
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
