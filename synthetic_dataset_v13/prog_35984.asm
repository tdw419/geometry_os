; DESCRIPTION: Renders a blue line between points (13, 80) and (138, 184).
; PLAN: r0=13(x1), r1=80(y1), r2=138(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 80
LDI r2, 138
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
