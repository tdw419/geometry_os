; DESCRIPTION: Places a blue line segment connecting (436, 16) to (381, 251).
; PLAN: r0=436(x1), r1=16(y1), r2=381(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 16
LDI r2, 381
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
