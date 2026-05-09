; DESCRIPTION: Renders a black line between points (477, 140) and (299, 94).
; PLAN: r0=477(x1), r1=140(y1), r2=299(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 140
LDI r2, 299
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
