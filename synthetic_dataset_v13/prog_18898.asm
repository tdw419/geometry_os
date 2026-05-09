; DESCRIPTION: Renders a black line between points (76, 133) and (345, 62).
; PLAN: r0=76(x1), r1=133(y1), r2=345(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 133
LDI r2, 345
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
