; DESCRIPTION: Places a orange line segment connecting (111, 133) to (231, 170).
; PLAN: r0=111(x1), r1=133(y1), r2=231(x2), r3=170(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 133
LDI r2, 231
LDI r3, 170
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
