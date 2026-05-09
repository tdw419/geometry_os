; DESCRIPTION: Draws a orange line from (129, 13) to (122, 61).
; PLAN: r0=129(x1), r1=13(y1), r2=122(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 13
LDI r2, 122
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
