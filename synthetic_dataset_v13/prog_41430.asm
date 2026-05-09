; DESCRIPTION: Renders a orange line between points (7, 157) and (83, 125).
; PLAN: r0=7(x1), r1=157(y1), r2=83(x2), r3=125(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 157
LDI r2, 83
LDI r3, 125
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
