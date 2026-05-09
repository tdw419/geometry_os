; DESCRIPTION: Renders a blue line between points (79, 13) and (194, 2).
; PLAN: r0=79(x1), r1=13(y1), r2=194(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 13
LDI r2, 194
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
