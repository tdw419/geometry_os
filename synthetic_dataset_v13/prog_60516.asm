; DESCRIPTION: Composite: Renders a black line between points (99, 113) and (20, 217) then Sets a single blue pixel at (260, 97).
; PLAN: r0=99(x1), r1=113(y1), r2=20(x2), r3=217(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=97(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 99
LDI r1, 113
LDI r2, 20
LDI r3, 217
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 97
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
