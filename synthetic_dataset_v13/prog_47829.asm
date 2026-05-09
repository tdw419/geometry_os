; DESCRIPTION: Places a blue line segment connecting (63, 251) to (469, 122).
; PLAN: r0=63(x1), r1=251(y1), r2=469(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 251
LDI r2, 469
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
