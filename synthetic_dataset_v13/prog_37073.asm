; DESCRIPTION: Composite: Places a cyan line segment connecting (425, 158) to (85, 3) then Places a green circle of radius 32 at center (359, 102) then Sets a single blue pixel at (19, 118).
; PLAN: r0=425(x1), r1=158(y1), r2=85(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=359(x), r6=102(y), r7=32(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=19(x), r11=118(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 425
LDI r1, 158
LDI r2, 85
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 102
LDI r7, 32
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 19
LDI r11, 118
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
