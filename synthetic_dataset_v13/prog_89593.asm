; DESCRIPTION: Renders a blue line between points (102, 167) and (259, 136).
; PLAN: r0=102(x1), r1=167(y1), r2=259(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 167
LDI r2, 259
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
