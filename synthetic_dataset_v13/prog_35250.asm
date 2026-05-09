; DESCRIPTION: Places a blue line segment connecting (408, 56) to (425, 79).
; PLAN: r0=408(x1), r1=56(y1), r2=425(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 56
LDI r2, 425
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
