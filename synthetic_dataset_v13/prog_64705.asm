; DESCRIPTION: Places a orange line segment connecting (6, 233) to (279, 247).
; PLAN: r0=6(x1), r1=233(y1), r2=279(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 233
LDI r2, 279
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
