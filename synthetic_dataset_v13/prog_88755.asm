; DESCRIPTION: Renders a black line between points (477, 251) and (418, 220).
; PLAN: r0=477(x1), r1=251(y1), r2=418(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 251
LDI r2, 418
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
