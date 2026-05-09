; DESCRIPTION: Renders a orange line between points (485, 52) and (33, 227).
; PLAN: r0=485(x1), r1=52(y1), r2=33(x2), r3=227(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 52
LDI r2, 33
LDI r3, 227
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
