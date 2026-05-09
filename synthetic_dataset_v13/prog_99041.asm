; DESCRIPTION: Places a orange line segment connecting (223, 180) to (4, 203).
; PLAN: r0=223(x1), r1=180(y1), r2=4(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 180
LDI r2, 4
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
