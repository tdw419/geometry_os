; DESCRIPTION: Places a blue line segment connecting (402, 233) to (254, 184).
; PLAN: r0=402(x1), r1=233(y1), r2=254(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 233
LDI r2, 254
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
