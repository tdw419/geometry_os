; DESCRIPTION: Places a blue line segment connecting (184, 154) to (132, 216).
; PLAN: r0=184(x1), r1=154(y1), r2=132(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 154
LDI r2, 132
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
