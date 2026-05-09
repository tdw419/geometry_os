; DESCRIPTION: Draws a orange line from (213, 3) to (99, 80).
; PLAN: r0=213(x1), r1=3(y1), r2=99(x2), r3=80(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 3
LDI r2, 99
LDI r3, 80
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
