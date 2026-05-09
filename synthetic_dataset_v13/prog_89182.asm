; DESCRIPTION: Renders a orange line between points (125, 106) and (130, 255).
; PLAN: r0=125(x1), r1=106(y1), r2=130(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 106
LDI r2, 130
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
