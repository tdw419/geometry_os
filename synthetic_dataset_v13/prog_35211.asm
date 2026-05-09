; DESCRIPTION: Places a magenta line segment connecting (195, 98) to (454, 85).
; PLAN: r0=195(x1), r1=98(y1), r2=454(x2), r3=85(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 98
LDI r2, 454
LDI r3, 85
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
