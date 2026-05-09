; DESCRIPTION: Places a magenta line segment connecting (316, 169) to (403, 199).
; PLAN: r0=316(x1), r1=169(y1), r2=403(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 169
LDI r2, 403
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
