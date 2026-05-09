; DESCRIPTION: Places a magenta line segment connecting (285, 37) to (357, 231).
; PLAN: r0=285(x1), r1=37(y1), r2=357(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 37
LDI r2, 357
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
