; DESCRIPTION: Places a orange line segment connecting (233, 19) to (8, 138).
; PLAN: r0=233(x1), r1=19(y1), r2=8(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 19
LDI r2, 8
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
