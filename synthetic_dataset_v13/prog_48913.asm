; DESCRIPTION: Draws a orange line from (149, 37) to (124, 101).
; PLAN: r0=149(x1), r1=37(y1), r2=124(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 37
LDI r2, 124
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
