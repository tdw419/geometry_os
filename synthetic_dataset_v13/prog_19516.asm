; DESCRIPTION: Places a magenta line segment connecting (373, 163) to (395, 63).
; PLAN: r0=373(x1), r1=163(y1), r2=395(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 163
LDI r2, 395
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
