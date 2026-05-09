; DESCRIPTION: Draws a orange line from (181, 52) to (353, 197).
; PLAN: r0=181(x1), r1=52(y1), r2=353(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 52
LDI r2, 353
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
