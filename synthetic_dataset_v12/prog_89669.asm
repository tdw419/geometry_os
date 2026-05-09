; DESCRIPTION: Places a magenta line segment connecting (301, 245) to (40, 4).
; PLAN: r0=301(x1), r1=245(y1), r2=40(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 245
LDI r2, 40
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
