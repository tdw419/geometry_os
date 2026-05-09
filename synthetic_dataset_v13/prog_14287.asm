; DESCRIPTION: Places a magenta line segment connecting (283, 252) to (91, 199).
; PLAN: r0=283(x1), r1=252(y1), r2=91(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 252
LDI r2, 91
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
