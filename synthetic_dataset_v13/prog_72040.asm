; DESCRIPTION: Places a magenta line segment connecting (8, 199) to (25, 98).
; PLAN: r0=8(x1), r1=199(y1), r2=25(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 199
LDI r2, 25
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
