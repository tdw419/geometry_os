; DESCRIPTION: Places a magenta line segment connecting (337, 71) to (367, 77).
; PLAN: r0=337(x1), r1=71(y1), r2=367(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 71
LDI r2, 367
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
