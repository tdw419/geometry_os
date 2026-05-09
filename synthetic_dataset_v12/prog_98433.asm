; DESCRIPTION: Composite: Renders a green line between points (299, 109) and (211, 123) then Sets a single blue pixel at (264, 91).
; PLAN: r0=299(x1), r1=109(y1), r2=211(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=91(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 299
LDI r1, 109
LDI r2, 211
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 91
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
