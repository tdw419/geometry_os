; DESCRIPTION: Composite: Renders a yellow line between points (435, 76) and (148, 75) then Renders a blue box of size 91x22 starting at (161, 3) then Sets a single red pixel at (49, 80).
; PLAN: r0=435(x1), r1=76(y1), r2=148(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=3(y), r7=91(width), r8=22(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=49(x), r11=80(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 435
LDI r1, 76
LDI r2, 148
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 3
LDI r7, 91
LDI r8, 22
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 49
LDI r11, 80
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
