; DESCRIPTION: Renders a orange line between points (157, 160) and (334, 250).
; PLAN: r0=157(x1), r1=160(y1), r2=334(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 160
LDI r2, 334
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
