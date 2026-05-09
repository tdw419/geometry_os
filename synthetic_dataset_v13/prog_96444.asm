; DESCRIPTION: Places a orange line segment connecting (278, 25) to (395, 6).
; PLAN: r0=278(x1), r1=25(y1), r2=395(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 25
LDI r2, 395
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
