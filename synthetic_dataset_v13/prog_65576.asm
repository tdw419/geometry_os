; DESCRIPTION: Renders a black line between points (417, 199) and (342, 172).
; PLAN: r0=417(x1), r1=199(y1), r2=342(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 199
LDI r2, 342
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
