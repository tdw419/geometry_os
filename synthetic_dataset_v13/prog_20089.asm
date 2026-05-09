; DESCRIPTION: Renders a black line between points (477, 173) and (417, 116).
; PLAN: r0=477(x1), r1=173(y1), r2=417(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 173
LDI r2, 417
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
