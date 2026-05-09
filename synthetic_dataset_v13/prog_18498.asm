; DESCRIPTION: Draws a orange line from (111, 53) to (95, 238).
; PLAN: r0=111(x1), r1=53(y1), r2=95(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 53
LDI r2, 95
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
