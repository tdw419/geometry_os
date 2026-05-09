; DESCRIPTION: Places a magenta line segment connecting (318, 61) to (221, 69).
; PLAN: r0=318(x1), r1=61(y1), r2=221(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 61
LDI r2, 221
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
