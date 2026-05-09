; DESCRIPTION: Places a orange line segment connecting (49, 230) to (66, 250).
; PLAN: r0=49(x1), r1=230(y1), r2=66(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 230
LDI r2, 66
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
