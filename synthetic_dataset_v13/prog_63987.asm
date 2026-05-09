; DESCRIPTION: Renders a blue line between points (302, 148) and (58, 183).
; PLAN: r0=302(x1), r1=148(y1), r2=58(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 148
LDI r2, 58
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
