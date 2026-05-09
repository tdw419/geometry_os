; DESCRIPTION: Draws a orange line from (495, 11) to (53, 238).
; PLAN: r0=495(x1), r1=11(y1), r2=53(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 11
LDI r2, 53
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
