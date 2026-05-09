; DESCRIPTION: Draws a orange line from (10, 149) to (58, 140).
; PLAN: r0=10(x1), r1=149(y1), r2=58(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 149
LDI r2, 58
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
