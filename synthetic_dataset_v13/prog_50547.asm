; DESCRIPTION: Draws a orange line from (57, 100) to (454, 196).
; PLAN: r0=57(x1), r1=100(y1), r2=454(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 100
LDI r2, 454
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
