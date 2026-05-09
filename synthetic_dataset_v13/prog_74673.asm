; DESCRIPTION: Composite: Renders a magenta line between points (470, 99) and (59, 89) then Sets a single blue pixel at (478, 90).
; PLAN: r0=470(x1), r1=99(y1), r2=59(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=478(x), r6=90(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 470
LDI r1, 99
LDI r2, 59
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 90
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
