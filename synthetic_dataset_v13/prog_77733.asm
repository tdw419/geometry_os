; DESCRIPTION: Renders a blue line between points (34, 166) and (26, 145).
; PLAN: r0=34(x1), r1=166(y1), r2=26(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 166
LDI r2, 26
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
