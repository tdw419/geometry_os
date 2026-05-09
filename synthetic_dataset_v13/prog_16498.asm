; DESCRIPTION: Places a magenta line segment connecting (71, 58) to (447, 179).
; PLAN: r0=71(x1), r1=58(y1), r2=447(x2), r3=179(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 58
LDI r2, 447
LDI r3, 179
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
