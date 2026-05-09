; DESCRIPTION: Composite: Renders a white line between points (167, 4) and (509, 189) then Sets a single yellow pixel at (396, 238).
; PLAN: r0=167(x1), r1=4(y1), r2=509(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=396(x), r6=238(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 167
LDI r1, 4
LDI r2, 509
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 238
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
