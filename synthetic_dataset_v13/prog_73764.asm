; DESCRIPTION: Places a magenta line segment connecting (409, 0) to (61, 140).
; PLAN: r0=409(x1), r1=0(y1), r2=61(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 0
LDI r2, 61
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
