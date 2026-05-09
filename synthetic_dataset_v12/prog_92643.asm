; DESCRIPTION: Places a orange line segment connecting (205, 5) to (57, 180).
; PLAN: r0=205(x1), r1=5(y1), r2=57(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 5
LDI r2, 57
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
