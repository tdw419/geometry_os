; DESCRIPTION: Renders a blue line between points (88, 68) and (421, 129).
; PLAN: r0=88(x1), r1=68(y1), r2=421(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 68
LDI r2, 421
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
