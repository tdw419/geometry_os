; DESCRIPTION: Composite: Renders a white line between points (192, 48) and (414, 146) then Sets a single yellow pixel at (138, 118).
; PLAN: r0=192(x1), r1=48(y1), r2=414(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=118(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 192
LDI r1, 48
LDI r2, 414
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 118
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
