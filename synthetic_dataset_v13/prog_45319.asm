; DESCRIPTION: Places a orange line segment connecting (394, 43) to (36, 20).
; PLAN: r0=394(x1), r1=43(y1), r2=36(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 43
LDI r2, 36
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
