; DESCRIPTION: Composite: Renders a purple line between points (365, 239) and (177, 87) then Sets a single black pixel at (262, 13).
; PLAN: r0=365(x1), r1=239(y1), r2=177(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=262(x), r6=13(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 365
LDI r1, 239
LDI r2, 177
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 13
LDI r7, 0x000000
PSET r5, r6, r7
HALT
