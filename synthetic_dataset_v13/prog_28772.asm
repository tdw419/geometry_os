; DESCRIPTION: Places a magenta line segment connecting (331, 218) to (137, 167).
; PLAN: r0=331(x1), r1=218(y1), r2=137(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 218
LDI r2, 137
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
