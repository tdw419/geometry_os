; DESCRIPTION: Places a magenta line segment connecting (451, 243) to (383, 14).
; PLAN: r0=451(x1), r1=243(y1), r2=383(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 243
LDI r2, 383
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
