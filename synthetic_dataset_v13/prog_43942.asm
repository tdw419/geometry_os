; DESCRIPTION: Places a orange line segment connecting (217, 203) to (504, 2).
; PLAN: r0=217(x1), r1=203(y1), r2=504(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 203
LDI r2, 504
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
