; DESCRIPTION: Places a blue line segment connecting (156, 129) to (427, 72).
; PLAN: r0=156(x1), r1=129(y1), r2=427(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 129
LDI r2, 427
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
