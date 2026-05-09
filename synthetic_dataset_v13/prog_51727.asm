; DESCRIPTION: Draws a orange line from (14, 132) to (353, 153).
; PLAN: r0=14(x1), r1=132(y1), r2=353(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 132
LDI r2, 353
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
