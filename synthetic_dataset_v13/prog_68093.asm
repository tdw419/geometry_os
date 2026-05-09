; DESCRIPTION: Places a magenta line segment connecting (55, 218) to (501, 193).
; PLAN: r0=55(x1), r1=218(y1), r2=501(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 218
LDI r2, 501
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
