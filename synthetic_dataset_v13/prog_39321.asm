; DESCRIPTION: Places a magenta line segment connecting (212, 212) to (28, 122).
; PLAN: r0=212(x1), r1=212(y1), r2=28(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 212
LDI r2, 28
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
