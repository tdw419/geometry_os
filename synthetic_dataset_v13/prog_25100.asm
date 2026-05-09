; DESCRIPTION: Places a magenta line segment connecting (324, 63) to (130, 61).
; PLAN: r0=324(x1), r1=63(y1), r2=130(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 63
LDI r2, 130
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
