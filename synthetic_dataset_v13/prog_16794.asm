; DESCRIPTION: Places a blue line segment connecting (434, 169) to (497, 9).
; PLAN: r0=434(x1), r1=169(y1), r2=497(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 169
LDI r2, 497
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
