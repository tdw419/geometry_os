; DESCRIPTION: Renders a orange line between points (499, 225) and (171, 161).
; PLAN: r0=499(x1), r1=225(y1), r2=171(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 225
LDI r2, 171
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
