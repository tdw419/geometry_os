; DESCRIPTION: Places a magenta line segment connecting (23, 143) to (336, 39).
; PLAN: r0=23(x1), r1=143(y1), r2=336(x2), r3=39(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 143
LDI r2, 336
LDI r3, 39
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
