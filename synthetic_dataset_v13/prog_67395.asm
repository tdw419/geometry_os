; DESCRIPTION: Draws a orange line from (53, 244) to (191, 33).
; PLAN: r0=53(x1), r1=244(y1), r2=191(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 244
LDI r2, 191
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
