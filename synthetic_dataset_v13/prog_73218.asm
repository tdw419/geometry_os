; DESCRIPTION: Renders a orange line between points (218, 172) and (419, 248).
; PLAN: r0=218(x1), r1=172(y1), r2=419(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 172
LDI r2, 419
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
