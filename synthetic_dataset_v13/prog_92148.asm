; DESCRIPTION: Renders a yellow line between points (317, 105) and (454, 133).
; PLAN: r0=317(x1), r1=105(y1), r2=454(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 105
LDI r2, 454
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
