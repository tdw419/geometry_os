; DESCRIPTION: Places a magenta line segment connecting (65, 159) to (421, 87).
; PLAN: r0=65(x1), r1=159(y1), r2=421(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 159
LDI r2, 421
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
