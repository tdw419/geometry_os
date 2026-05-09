; DESCRIPTION: Draws a orange line from (386, 140) to (500, 157).
; PLAN: r0=386(x1), r1=140(y1), r2=500(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 140
LDI r2, 500
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
