; DESCRIPTION: Draws a orange line from (189, 102) to (299, 248).
; PLAN: r0=189(x1), r1=102(y1), r2=299(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 102
LDI r2, 299
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
