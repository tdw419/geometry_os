; DESCRIPTION: Places a orange line segment connecting (382, 4) to (293, 84).
; PLAN: r0=382(x1), r1=4(y1), r2=293(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 4
LDI r2, 293
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
