; DESCRIPTION: Renders a black line between points (26, 36) and (120, 218).
; PLAN: r0=26(x1), r1=36(y1), r2=120(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 36
LDI r2, 120
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
