; DESCRIPTION: Places a magenta line segment connecting (208, 131) to (457, 109).
; PLAN: r0=208(x1), r1=131(y1), r2=457(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 131
LDI r2, 457
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
