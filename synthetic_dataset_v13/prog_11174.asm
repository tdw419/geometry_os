; DESCRIPTION: Draws a orange line from (293, 29) to (36, 162).
; PLAN: r0=293(x1), r1=29(y1), r2=36(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 29
LDI r2, 36
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
