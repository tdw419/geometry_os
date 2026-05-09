; DESCRIPTION: Places a blue line segment connecting (87, 72) to (351, 102).
; PLAN: r0=87(x1), r1=72(y1), r2=351(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 72
LDI r2, 351
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
