; DESCRIPTION: Renders a orange line between points (244, 235) and (283, 214).
; PLAN: r0=244(x1), r1=235(y1), r2=283(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 235
LDI r2, 283
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
