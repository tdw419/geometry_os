; DESCRIPTION: Places a magenta line segment connecting (141, 36) to (188, 227).
; PLAN: r0=141(x1), r1=36(y1), r2=188(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 36
LDI r2, 188
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
