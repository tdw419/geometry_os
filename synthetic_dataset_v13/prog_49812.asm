; DESCRIPTION: Draws a orange line from (395, 188) to (189, 10).
; PLAN: r0=395(x1), r1=188(y1), r2=189(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 188
LDI r2, 189
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
