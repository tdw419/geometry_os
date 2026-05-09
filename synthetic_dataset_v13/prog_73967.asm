; DESCRIPTION: Renders a orange line between points (501, 116) and (355, 37).
; PLAN: r0=501(x1), r1=116(y1), r2=355(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 116
LDI r2, 355
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
