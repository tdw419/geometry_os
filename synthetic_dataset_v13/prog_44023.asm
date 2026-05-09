; DESCRIPTION: Draws a orange line from (505, 148) to (316, 87).
; PLAN: r0=505(x1), r1=148(y1), r2=316(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 148
LDI r2, 316
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
