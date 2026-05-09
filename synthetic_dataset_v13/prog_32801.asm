; DESCRIPTION: Places a orange line segment connecting (223, 243) to (9, 205).
; PLAN: r0=223(x1), r1=243(y1), r2=9(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 243
LDI r2, 9
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
