; DESCRIPTION: Renders a blue line between points (227, 26) and (14, 132).
; PLAN: r0=227(x1), r1=26(y1), r2=14(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 26
LDI r2, 14
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
