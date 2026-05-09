; DESCRIPTION: Draws a orange line from (102, 241) to (33, 73).
; PLAN: r0=102(x1), r1=241(y1), r2=33(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 241
LDI r2, 33
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
