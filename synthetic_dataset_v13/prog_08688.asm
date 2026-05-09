; DESCRIPTION: Renders a orange line between points (27, 125) and (188, 250).
; PLAN: r0=27(x1), r1=125(y1), r2=188(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 125
LDI r2, 188
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
