; DESCRIPTION: Places a purple line segment connecting (290, 250) to (105, 232).
; PLAN: r0=290(x1), r1=250(y1), r2=105(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 250
LDI r2, 105
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
