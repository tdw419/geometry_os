; DESCRIPTION: Composite: Renders a yellow line between points (241, 237) and (52, 44) then Sets a single blue pixel at (76, 145).
; PLAN: r0=241(x1), r1=237(y1), r2=52(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=76(x), r6=145(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 241
LDI r1, 237
LDI r2, 52
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 145
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
