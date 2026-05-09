; DESCRIPTION: Places a orange line segment connecting (13, 189) to (28, 180).
; PLAN: r0=13(x1), r1=189(y1), r2=28(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 189
LDI r2, 28
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
