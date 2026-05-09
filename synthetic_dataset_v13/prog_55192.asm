; DESCRIPTION: Renders a orange line between points (500, 39) and (176, 157).
; PLAN: r0=500(x1), r1=39(y1), r2=176(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 39
LDI r2, 176
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
