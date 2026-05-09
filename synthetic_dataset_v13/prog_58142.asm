; DESCRIPTION: Places a orange line segment connecting (110, 77) to (193, 57).
; PLAN: r0=110(x1), r1=77(y1), r2=193(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 77
LDI r2, 193
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
