; DESCRIPTION: Draws a orange line from (299, 62) to (151, 138).
; PLAN: r0=299(x1), r1=62(y1), r2=151(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 62
LDI r2, 151
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
