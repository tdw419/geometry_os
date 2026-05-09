; DESCRIPTION: Places a orange line segment connecting (262, 245) to (428, 83).
; PLAN: r0=262(x1), r1=245(y1), r2=428(x2), r3=83(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 245
LDI r2, 428
LDI r3, 83
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
