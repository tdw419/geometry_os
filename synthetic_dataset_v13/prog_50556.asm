; DESCRIPTION: Places a purple line segment connecting (357, 241) to (125, 183).
; PLAN: r0=357(x1), r1=241(y1), r2=125(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 241
LDI r2, 125
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
