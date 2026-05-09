; DESCRIPTION: Draws a orange line from (182, 189) to (102, 14).
; PLAN: r0=182(x1), r1=189(y1), r2=102(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 189
LDI r2, 102
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
