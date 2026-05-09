; DESCRIPTION: Composite: Renders a purple line between points (315, 52) and (36, 225) then Places a red dot at position (282, 195).
; PLAN: r0=315(x1), r1=52(y1), r2=36(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=195(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 315
LDI r1, 52
LDI r2, 36
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 195
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
