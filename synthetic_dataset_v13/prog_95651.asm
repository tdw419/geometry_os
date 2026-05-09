; DESCRIPTION: Composite: Renders a cyan line between points (3, 218) and (297, 193) then Sets a single black pixel at (497, 234).
; PLAN: r0=3(x1), r1=218(y1), r2=297(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=497(x), r6=234(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 3
LDI r1, 218
LDI r2, 297
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 497
LDI r6, 234
LDI r7, 0x000000
PSET r5, r6, r7
HALT
