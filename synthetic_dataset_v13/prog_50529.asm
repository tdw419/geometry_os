; DESCRIPTION: Renders a orange line between points (372, 229) and (6, 238).
; PLAN: r0=372(x1), r1=229(y1), r2=6(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 229
LDI r2, 6
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
