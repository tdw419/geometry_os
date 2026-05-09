; DESCRIPTION: Renders a black line between points (330, 237) and (477, 218).
; PLAN: r0=330(x1), r1=237(y1), r2=477(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 237
LDI r2, 477
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
