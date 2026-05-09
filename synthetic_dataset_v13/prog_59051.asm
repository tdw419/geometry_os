; DESCRIPTION: Places a magenta line segment connecting (491, 159) to (126, 165).
; PLAN: r0=491(x1), r1=159(y1), r2=126(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 159
LDI r2, 126
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
