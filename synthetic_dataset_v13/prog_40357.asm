; DESCRIPTION: Places a magenta line segment connecting (334, 195) to (444, 131).
; PLAN: r0=334(x1), r1=195(y1), r2=444(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 195
LDI r2, 444
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
