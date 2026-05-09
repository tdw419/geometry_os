; DESCRIPTION: Composite: Renders a yellow line between points (453, 76) and (273, 24) then Sets a single green pixel at (498, 25).
; PLAN: r0=453(x1), r1=76(y1), r2=273(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=498(x), r6=25(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 453
LDI r1, 76
LDI r2, 273
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 498
LDI r6, 25
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
