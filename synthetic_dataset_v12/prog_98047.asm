; DESCRIPTION: Renders a orange line between points (2, 163) and (261, 73).
; PLAN: r0=2(x1), r1=163(y1), r2=261(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 163
LDI r2, 261
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
