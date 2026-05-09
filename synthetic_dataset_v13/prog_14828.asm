; DESCRIPTION: Renders a blue line between points (138, 227) and (132, 247).
; PLAN: r0=138(x1), r1=227(y1), r2=132(x2), r3=247(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 227
LDI r2, 132
LDI r3, 247
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
