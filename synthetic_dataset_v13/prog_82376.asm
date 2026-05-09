; DESCRIPTION: Places a magenta line segment connecting (471, 125) to (212, 104).
; PLAN: r0=471(x1), r1=125(y1), r2=212(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 125
LDI r2, 212
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
