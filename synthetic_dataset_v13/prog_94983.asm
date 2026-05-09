; DESCRIPTION: Places a magenta line segment connecting (49, 241) to (373, 15).
; PLAN: r0=49(x1), r1=241(y1), r2=373(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 241
LDI r2, 373
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
