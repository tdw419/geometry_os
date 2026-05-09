; DESCRIPTION: Places a magenta line segment connecting (30, 46) to (140, 140).
; PLAN: r0=30(x1), r1=46(y1), r2=140(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 46
LDI r2, 140
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
