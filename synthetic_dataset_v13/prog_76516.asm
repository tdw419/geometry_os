; DESCRIPTION: Draws a orange line from (262, 78) to (189, 248).
; PLAN: r0=262(x1), r1=78(y1), r2=189(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 78
LDI r2, 189
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
