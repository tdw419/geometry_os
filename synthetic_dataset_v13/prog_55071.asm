; DESCRIPTION: Renders a orange line between points (191, 10) and (261, 39).
; PLAN: r0=191(x1), r1=10(y1), r2=261(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 10
LDI r2, 261
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
