; DESCRIPTION: Places a blue line segment connecting (309, 218) to (156, 36).
; PLAN: r0=309(x1), r1=218(y1), r2=156(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 218
LDI r2, 156
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
