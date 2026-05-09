; DESCRIPTION: Places a purple line segment connecting (354, 16) to (54, 72).
; PLAN: r0=354(x1), r1=16(y1), r2=54(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 16
LDI r2, 54
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
