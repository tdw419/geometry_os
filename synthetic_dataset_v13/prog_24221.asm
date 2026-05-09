; DESCRIPTION: Places a red line segment connecting (430, 78) to (499, 232).
; PLAN: r0=430(x1), r1=78(y1), r2=499(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 78
LDI r2, 499
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
