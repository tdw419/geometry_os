; DESCRIPTION: Composite: Renders a purple line between points (119, 112) and (144, 86) then Sets a single blue pixel at (426, 33).
; PLAN: r0=119(x1), r1=112(y1), r2=144(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=426(x), r6=33(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 119
LDI r1, 112
LDI r2, 144
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 33
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
