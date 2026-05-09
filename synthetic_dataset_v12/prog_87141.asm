; DESCRIPTION: Draws a orange line from (109, 72) to (205, 23).
; PLAN: r0=109(x1), r1=72(y1), r2=205(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 72
LDI r2, 205
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
