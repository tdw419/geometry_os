; DESCRIPTION: Places a orange line segment connecting (458, 48) to (97, 142).
; PLAN: r0=458(x1), r1=48(y1), r2=97(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 48
LDI r2, 97
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
