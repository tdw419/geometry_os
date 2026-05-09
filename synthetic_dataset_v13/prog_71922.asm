; DESCRIPTION: Places a magenta line segment connecting (325, 98) to (138, 97).
; PLAN: r0=325(x1), r1=98(y1), r2=138(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 98
LDI r2, 138
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
