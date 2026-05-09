; DESCRIPTION: Places a black line segment connecting (477, 221) to (471, 199).
; PLAN: r0=477(x1), r1=221(y1), r2=471(x2), r3=199(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 221
LDI r2, 471
LDI r3, 199
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
