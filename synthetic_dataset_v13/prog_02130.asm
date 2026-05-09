; DESCRIPTION: Renders a black line between points (379, 164) and (467, 199).
; PLAN: r0=379(x1), r1=164(y1), r2=467(x2), r3=199(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 164
LDI r2, 467
LDI r3, 199
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
