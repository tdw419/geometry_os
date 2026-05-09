; DESCRIPTION: Composite: Renders a orange line between points (229, 71) and (338, 238) then Sets a single black pixel at (325, 213).
; PLAN: r0=229(x1), r1=71(y1), r2=338(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=325(x), r6=213(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 229
LDI r1, 71
LDI r2, 338
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 213
LDI r7, 0x000000
PSET r5, r6, r7
HALT
