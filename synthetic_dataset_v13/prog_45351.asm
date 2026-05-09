; DESCRIPTION: Places a orange line segment connecting (217, 175) to (289, 211).
; PLAN: r0=217(x1), r1=175(y1), r2=289(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 175
LDI r2, 289
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
