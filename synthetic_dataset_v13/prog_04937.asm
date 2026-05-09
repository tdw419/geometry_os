; DESCRIPTION: Renders a black line between points (327, 159) and (508, 211).
; PLAN: r0=327(x1), r1=159(y1), r2=508(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 159
LDI r2, 508
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
