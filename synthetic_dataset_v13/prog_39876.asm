; DESCRIPTION: Renders a black line between points (342, 143) and (376, 238).
; PLAN: r0=342(x1), r1=143(y1), r2=376(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 143
LDI r2, 376
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
