; DESCRIPTION: Places a magenta line segment connecting (62, 205) to (428, 30).
; PLAN: r0=62(x1), r1=205(y1), r2=428(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 205
LDI r2, 428
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
