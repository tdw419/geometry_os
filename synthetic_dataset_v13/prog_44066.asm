; DESCRIPTION: Composite: Renders a red box of size 52x110 starting at (149, 3) then Renders a blue line between points (68, 69) and (185, 0) then Sets a single purple pixel at (454, 181).
; PLAN: r0=149(x), r1=3(y), r2=52(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x1), r6=69(y1), r7=185(x2), r8=0(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=454(x), r11=181(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 149
LDI r1, 3
LDI r2, 52
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 69
LDI r7, 185
LDI r8, 0
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 454
LDI r11, 181
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
