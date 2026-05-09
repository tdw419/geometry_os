; DESCRIPTION: Places a orange line segment connecting (436, 125) to (231, 202).
; PLAN: r0=436(x1), r1=125(y1), r2=231(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 125
LDI r2, 231
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
