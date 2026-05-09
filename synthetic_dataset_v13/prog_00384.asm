; DESCRIPTION: Renders a blue line between points (501, 138) and (449, 130).
; PLAN: r0=501(x1), r1=138(y1), r2=449(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 138
LDI r2, 449
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
