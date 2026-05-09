; DESCRIPTION: Places a magenta line segment connecting (420, 75) to (414, 44).
; PLAN: r0=420(x1), r1=75(y1), r2=414(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 75
LDI r2, 414
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
