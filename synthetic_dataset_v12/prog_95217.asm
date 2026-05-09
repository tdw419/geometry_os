; DESCRIPTION: Composite: Sets a single yellow pixel at (159, 146) then Renders a purple line between points (122, 193) and (358, 137).
; PLAN: r0=159(x), r1=146(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=122(x1), r6=193(y1), r7=358(x2), r8=137(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 159
LDI r1, 146
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 122
LDI r6, 193
LDI r7, 358
LDI r8, 137
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
