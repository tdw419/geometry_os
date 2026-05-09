; DESCRIPTION: Places a magenta line segment connecting (309, 248) to (15, 72).
; PLAN: r0=309(x1), r1=248(y1), r2=15(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 248
LDI r2, 15
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
