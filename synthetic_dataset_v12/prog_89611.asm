; DESCRIPTION: Places a magenta line segment connecting (62, 48) to (438, 19).
; PLAN: r0=62(x1), r1=48(y1), r2=438(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 48
LDI r2, 438
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
