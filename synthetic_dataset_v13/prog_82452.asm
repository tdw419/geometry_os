; DESCRIPTION: Draws a orange line from (388, 112) to (428, 3).
; PLAN: r0=388(x1), r1=112(y1), r2=428(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 112
LDI r2, 428
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
