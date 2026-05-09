; DESCRIPTION: Renders a orange line between points (267, 104) and (7, 93).
; PLAN: r0=267(x1), r1=104(y1), r2=7(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 104
LDI r2, 7
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
