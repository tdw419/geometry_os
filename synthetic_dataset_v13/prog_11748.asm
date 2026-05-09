; DESCRIPTION: Renders a orange line between points (77, 139) and (129, 134).
; PLAN: r0=77(x1), r1=139(y1), r2=129(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 139
LDI r2, 129
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
