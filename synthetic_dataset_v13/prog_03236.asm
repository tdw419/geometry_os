; DESCRIPTION: Renders a orange line between points (111, 227) and (399, 233).
; PLAN: r0=111(x1), r1=227(y1), r2=399(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 227
LDI r2, 399
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
