; DESCRIPTION: Renders a black line between points (449, 157) and (297, 45).
; PLAN: r0=449(x1), r1=157(y1), r2=297(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 157
LDI r2, 297
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
