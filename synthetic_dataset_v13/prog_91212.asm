; DESCRIPTION: Draws a orange line from (30, 169) to (23, 30).
; PLAN: r0=30(x1), r1=169(y1), r2=23(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 169
LDI r2, 23
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
