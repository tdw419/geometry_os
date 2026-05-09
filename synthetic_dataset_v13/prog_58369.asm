; DESCRIPTION: Renders a orange line between points (122, 10) and (406, 34).
; PLAN: r0=122(x1), r1=10(y1), r2=406(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 10
LDI r2, 406
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
