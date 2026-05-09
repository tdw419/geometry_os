; DESCRIPTION: Draws a orange line from (170, 33) to (24, 90).
; PLAN: r0=170(x1), r1=33(y1), r2=24(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 33
LDI r2, 24
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
