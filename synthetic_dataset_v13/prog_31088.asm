; DESCRIPTION: Places a blue line segment connecting (457, 58) to (408, 64).
; PLAN: r0=457(x1), r1=58(y1), r2=408(x2), r3=64(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 58
LDI r2, 408
LDI r3, 64
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
