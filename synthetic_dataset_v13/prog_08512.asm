; DESCRIPTION: Draws a orange line from (484, 97) to (81, 104).
; PLAN: r0=484(x1), r1=97(y1), r2=81(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 97
LDI r2, 81
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
