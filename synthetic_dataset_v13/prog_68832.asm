; DESCRIPTION: Places a green line segment connecting (436, 28) to (432, 24).
; PLAN: r0=436(x1), r1=28(y1), r2=432(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 28
LDI r2, 432
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
