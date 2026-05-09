; DESCRIPTION: Places a purple line segment connecting (436, 114) to (432, 231).
; PLAN: r0=436(x1), r1=114(y1), r2=432(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 114
LDI r2, 432
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
