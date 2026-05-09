; DESCRIPTION: Places a orange line segment connecting (499, 217) to (15, 107).
; PLAN: r0=499(x1), r1=217(y1), r2=15(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 217
LDI r2, 15
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
