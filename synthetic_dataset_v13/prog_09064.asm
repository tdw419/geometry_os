; DESCRIPTION: Draws a orange line from (3, 56) to (247, 238).
; PLAN: r0=3(x1), r1=56(y1), r2=247(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 56
LDI r2, 247
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
