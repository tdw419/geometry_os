; DESCRIPTION: Renders a blue line between points (158, 211) and (165, 123).
; PLAN: r0=158(x1), r1=211(y1), r2=165(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 211
LDI r2, 165
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
