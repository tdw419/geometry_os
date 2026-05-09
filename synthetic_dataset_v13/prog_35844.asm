; DESCRIPTION: Draws a orange line from (34, 63) to (352, 191).
; PLAN: r0=34(x1), r1=63(y1), r2=352(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 63
LDI r2, 352
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
