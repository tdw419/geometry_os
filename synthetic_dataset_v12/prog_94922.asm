; DESCRIPTION: Renders a orange line between points (437, 181) and (458, 248).
; PLAN: r0=437(x1), r1=181(y1), r2=458(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 181
LDI r2, 458
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
