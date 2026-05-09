; DESCRIPTION: Places a blue line segment connecting (16, 56) to (178, 211).
; PLAN: r0=16(x1), r1=56(y1), r2=178(x2), r3=211(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 56
LDI r2, 178
LDI r3, 211
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
