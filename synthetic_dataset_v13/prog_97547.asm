; DESCRIPTION: Places a magenta line segment connecting (265, 37) to (250, 247).
; PLAN: r0=265(x1), r1=37(y1), r2=250(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 37
LDI r2, 250
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
