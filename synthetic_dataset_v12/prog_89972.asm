; DESCRIPTION: Renders a black line between points (389, 88) and (376, 254).
; PLAN: r0=389(x1), r1=88(y1), r2=376(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 88
LDI r2, 376
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
