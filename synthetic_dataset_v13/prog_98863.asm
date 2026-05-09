; DESCRIPTION: Composite: Renders a green disk with center (230, 158) and radius 73 then Draws a blue line from (201, 198) to (98, 77) then Sets a single yellow pixel at (363, 193).
; PLAN: r0=230(x), r1=158(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x1), r6=198(y1), r7=98(x2), r8=77(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=363(x), r11=193(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 230
LDI r1, 158
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 198
LDI r7, 98
LDI r8, 77
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 363
LDI r11, 193
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
