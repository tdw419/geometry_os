; DESCRIPTION: Renders a blue line between points (471, 214) and (62, 183).
; PLAN: r0=471(x1), r1=214(y1), r2=62(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 214
LDI r2, 62
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
