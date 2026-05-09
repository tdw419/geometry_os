; DESCRIPTION: Draws a orange line from (246, 57) to (500, 227).
; PLAN: r0=246(x1), r1=57(y1), r2=500(x2), r3=227(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 57
LDI r2, 500
LDI r3, 227
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
