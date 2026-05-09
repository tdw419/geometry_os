; DESCRIPTION: Places a orange line segment connecting (469, 48) to (256, 217).
; PLAN: r0=469(x1), r1=48(y1), r2=256(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 48
LDI r2, 256
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
