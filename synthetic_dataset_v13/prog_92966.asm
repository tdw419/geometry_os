; DESCRIPTION: Composite: Draws a red circle centered at (390, 48) with radius 34 then Renders a purple line between points (170, 96) and (301, 205) then Sets a single yellow pixel at (19, 218).
; PLAN: r0=390(x), r1=48(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=170(x1), r6=96(y1), r7=301(x2), r8=205(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=19(x), r11=218(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 390
LDI r1, 48
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 170
LDI r6, 96
LDI r7, 301
LDI r8, 205
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 19
LDI r11, 218
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
