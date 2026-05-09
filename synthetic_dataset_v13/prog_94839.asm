; DESCRIPTION: Places a blue line segment connecting (402, 252) to (465, 155).
; PLAN: r0=402(x1), r1=252(y1), r2=465(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 252
LDI r2, 465
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
