; DESCRIPTION: Places a orange line segment connecting (140, 230) to (56, 64).
; PLAN: r0=140(x1), r1=230(y1), r2=56(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 230
LDI r2, 56
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
