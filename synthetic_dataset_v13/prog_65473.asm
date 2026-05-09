; DESCRIPTION: Places a magenta line segment connecting (124, 169) to (413, 170).
; PLAN: r0=124(x1), r1=169(y1), r2=413(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 169
LDI r2, 413
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
