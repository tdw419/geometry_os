; DESCRIPTION: Renders a orange line between points (221, 172) and (151, 168).
; PLAN: r0=221(x1), r1=172(y1), r2=151(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 172
LDI r2, 151
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
