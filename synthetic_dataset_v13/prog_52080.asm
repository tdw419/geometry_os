; DESCRIPTION: Places a magenta line segment connecting (241, 251) to (105, 1).
; PLAN: r0=241(x1), r1=251(y1), r2=105(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 251
LDI r2, 105
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
