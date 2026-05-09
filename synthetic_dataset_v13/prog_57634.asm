; DESCRIPTION: Composite: Renders a blue line between points (62, 71) and (200, 150) then Sets a single orange pixel at (132, 25).
; PLAN: r0=62(x1), r1=71(y1), r2=200(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=132(x), r6=25(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 62
LDI r1, 71
LDI r2, 200
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 25
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
