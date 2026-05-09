; DESCRIPTION: Places a blue line segment connecting (290, 250) to (381, 205).
; PLAN: r0=290(x1), r1=250(y1), r2=381(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 250
LDI r2, 381
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
