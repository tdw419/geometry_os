; DESCRIPTION: Draws a orange line from (465, 24) to (291, 158).
; PLAN: r0=465(x1), r1=24(y1), r2=291(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 24
LDI r2, 291
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
