; DESCRIPTION: Places a blue line segment connecting (290, 26) to (426, 147).
; PLAN: r0=290(x1), r1=26(y1), r2=426(x2), r3=147(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 26
LDI r2, 426
LDI r3, 147
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
