; DESCRIPTION: Places a magenta line segment connecting (218, 23) to (383, 58).
; PLAN: r0=218(x1), r1=23(y1), r2=383(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 23
LDI r2, 383
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
