; DESCRIPTION: Places a orange line segment connecting (43, 1) to (143, 15).
; PLAN: r0=43(x1), r1=1(y1), r2=143(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 1
LDI r2, 143
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
