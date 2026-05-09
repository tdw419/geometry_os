; DESCRIPTION: Draws a orange line from (97, 78) to (304, 19).
; PLAN: r0=97(x1), r1=78(y1), r2=304(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 78
LDI r2, 304
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
