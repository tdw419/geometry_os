; DESCRIPTION: Composite: Renders a black line between points (260, 177) and (244, 179) then Places a purple dot at position (198, 247).
; PLAN: r0=260(x1), r1=177(y1), r2=244(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=198(x), r6=247(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 260
LDI r1, 177
LDI r2, 244
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 247
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
