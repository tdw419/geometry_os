; DESCRIPTION: Places a blue line segment connecting (402, 193) to (142, 0).
; PLAN: r0=402(x1), r1=193(y1), r2=142(x2), r3=0(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 193
LDI r2, 142
LDI r3, 0
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
