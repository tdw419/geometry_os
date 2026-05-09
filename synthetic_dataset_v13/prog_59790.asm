; DESCRIPTION: Composite: Draws a red line from (510, 200) to (34, 84) then Places a orange circle of radius 76 at center (158, 100) then Sets a single magenta pixel at (142, 218).
; PLAN: r0=510(x1), r1=200(y1), r2=34(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=158(x), r6=100(y), r7=76(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=142(x), r11=218(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 510
LDI r1, 200
LDI r2, 34
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 100
LDI r7, 76
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 142
LDI r11, 218
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
