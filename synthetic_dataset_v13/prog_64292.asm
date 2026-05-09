; DESCRIPTION: Composite: Renders a green line between points (144, 87) and (17, 147) then Sets a single blue pixel at (27, 237).
; PLAN: r0=144(x1), r1=87(y1), r2=17(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=27(x), r6=237(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 144
LDI r1, 87
LDI r2, 17
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 237
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
