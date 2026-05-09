; DESCRIPTION: Renders a black line between points (385, 133) and (247, 7).
; PLAN: r0=385(x1), r1=133(y1), r2=247(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 133
LDI r2, 247
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
