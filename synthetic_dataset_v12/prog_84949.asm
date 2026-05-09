; DESCRIPTION: Renders a orange line between points (188, 122) and (47, 171).
; PLAN: r0=188(x1), r1=122(y1), r2=47(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 122
LDI r2, 47
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
