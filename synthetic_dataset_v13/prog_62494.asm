; DESCRIPTION: Renders a orange line between points (171, 248) and (299, 211).
; PLAN: r0=171(x1), r1=248(y1), r2=299(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 248
LDI r2, 299
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
