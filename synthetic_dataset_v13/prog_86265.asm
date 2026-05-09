; DESCRIPTION: Composite: Places a cyan line segment connecting (110, 115) to (381, 181) then Places a purple circle of radius 40 at center (80, 94) then Sets a single yellow pixel at (65, 37).
; PLAN: r0=110(x1), r1=115(y1), r2=381(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=80(x), r6=94(y), r7=40(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=65(x), r11=37(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 110
LDI r1, 115
LDI r2, 381
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 94
LDI r7, 40
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 65
LDI r11, 37
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
