; DESCRIPTION: Places a orange line segment connecting (492, 250) to (122, 66).
; PLAN: r0=492(x1), r1=250(y1), r2=122(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 250
LDI r2, 122
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
