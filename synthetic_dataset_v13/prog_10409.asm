; DESCRIPTION: Draws a orange line from (34, 37) to (283, 197).
; PLAN: r0=34(x1), r1=37(y1), r2=283(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 37
LDI r2, 283
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
