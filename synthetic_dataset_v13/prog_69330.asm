; DESCRIPTION: Places a blue line segment connecting (254, 216) to (282, 186).
; PLAN: r0=254(x1), r1=216(y1), r2=282(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 216
LDI r2, 282
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
