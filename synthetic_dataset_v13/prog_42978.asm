; DESCRIPTION: Places a magenta line segment connecting (104, 149) to (471, 185).
; PLAN: r0=104(x1), r1=149(y1), r2=471(x2), r3=185(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 149
LDI r2, 471
LDI r3, 185
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
