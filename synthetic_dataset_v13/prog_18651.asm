; DESCRIPTION: Renders a orange line between points (486, 125) and (255, 97).
; PLAN: r0=486(x1), r1=125(y1), r2=255(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 125
LDI r2, 255
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
