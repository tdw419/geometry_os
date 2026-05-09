; DESCRIPTION: Draws a orange line from (118, 84) to (116, 25).
; PLAN: r0=118(x1), r1=84(y1), r2=116(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 84
LDI r2, 116
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
