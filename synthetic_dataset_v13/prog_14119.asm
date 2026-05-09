; DESCRIPTION: Renders a black line between points (463, 40) and (120, 133).
; PLAN: r0=463(x1), r1=40(y1), r2=120(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 40
LDI r2, 120
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
