; DESCRIPTION: Places a magenta line segment connecting (247, 135) to (176, 201).
; PLAN: r0=247(x1), r1=135(y1), r2=176(x2), r3=201(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 135
LDI r2, 176
LDI r3, 201
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
