; DESCRIPTION: Places a blue line segment connecting (5, 115) to (325, 108).
; PLAN: r0=5(x1), r1=115(y1), r2=325(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 115
LDI r2, 325
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
