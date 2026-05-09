; DESCRIPTION: Renders a orange line between points (482, 171) and (396, 19).
; PLAN: r0=482(x1), r1=171(y1), r2=396(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 171
LDI r2, 396
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
