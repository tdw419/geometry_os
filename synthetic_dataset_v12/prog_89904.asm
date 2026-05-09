; DESCRIPTION: Renders a blue line between points (196, 95) and (259, 106).
; PLAN: r0=196(x1), r1=95(y1), r2=259(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 95
LDI r2, 259
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
