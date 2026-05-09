; DESCRIPTION: Places a magenta line segment connecting (29, 200) to (167, 72).
; PLAN: r0=29(x1), r1=200(y1), r2=167(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 200
LDI r2, 167
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
