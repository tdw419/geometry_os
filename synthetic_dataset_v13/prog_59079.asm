; DESCRIPTION: Renders a orange line between points (482, 234) and (5, 238).
; PLAN: r0=482(x1), r1=234(y1), r2=5(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 234
LDI r2, 5
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
