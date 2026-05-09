; DESCRIPTION: Draws a orange line from (72, 121) to (151, 176).
; PLAN: r0=72(x1), r1=121(y1), r2=151(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 121
LDI r2, 151
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
