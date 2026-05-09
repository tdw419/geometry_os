; DESCRIPTION: Places a magenta line segment connecting (496, 159) to (222, 98).
; PLAN: r0=496(x1), r1=159(y1), r2=222(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 159
LDI r2, 222
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
