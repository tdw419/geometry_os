; DESCRIPTION: Places a orange line segment connecting (511, 98) to (181, 40).
; PLAN: r0=511(x1), r1=98(y1), r2=181(x2), r3=40(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 98
LDI r2, 181
LDI r3, 40
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
