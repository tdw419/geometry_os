; DESCRIPTION: Composite: Renders a purple line between points (378, 233) and (178, 5) then Places a red dot at position (449, 179).
; PLAN: r0=378(x1), r1=233(y1), r2=178(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=449(x), r6=179(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 378
LDI r1, 233
LDI r2, 178
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 179
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
