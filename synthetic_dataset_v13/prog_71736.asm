; DESCRIPTION: Renders a blue line between points (62, 101) and (31, 183).
; PLAN: r0=62(x1), r1=101(y1), r2=31(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 101
LDI r2, 31
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
