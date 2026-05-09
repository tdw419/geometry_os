; DESCRIPTION: Places a blue line segment connecting (459, 147) to (259, 196).
; PLAN: r0=459(x1), r1=147(y1), r2=259(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 147
LDI r2, 259
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
