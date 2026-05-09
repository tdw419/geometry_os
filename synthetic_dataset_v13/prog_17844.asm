; DESCRIPTION: Places a blue line segment connecting (351, 48) to (60, 100).
; PLAN: r0=351(x1), r1=48(y1), r2=60(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 48
LDI r2, 60
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
