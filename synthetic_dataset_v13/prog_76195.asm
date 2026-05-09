; DESCRIPTION: Places a blue line segment connecting (432, 29) to (354, 34).
; PLAN: r0=432(x1), r1=29(y1), r2=354(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 29
LDI r2, 354
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
