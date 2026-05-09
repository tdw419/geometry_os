; DESCRIPTION: Renders a blue line between points (501, 245) and (506, 158).
; PLAN: r0=501(x1), r1=245(y1), r2=506(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 245
LDI r2, 506
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
