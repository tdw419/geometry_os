; DESCRIPTION: Places a magenta line segment connecting (283, 0) to (314, 65).
; PLAN: r0=283(x1), r1=0(y1), r2=314(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 0
LDI r2, 314
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
