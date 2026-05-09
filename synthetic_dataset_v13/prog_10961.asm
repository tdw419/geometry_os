; DESCRIPTION: Places a orange line segment connecting (238, 43) to (330, 7).
; PLAN: r0=238(x1), r1=43(y1), r2=330(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 43
LDI r2, 330
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
