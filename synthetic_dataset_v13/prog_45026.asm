; DESCRIPTION: Places a magenta line segment connecting (425, 155) to (325, 58).
; PLAN: r0=425(x1), r1=155(y1), r2=325(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 155
LDI r2, 325
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
