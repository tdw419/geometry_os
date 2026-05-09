; DESCRIPTION: Renders a orange line between points (74, 70) and (267, 70).
; PLAN: r0=74(x1), r1=70(y1), r2=267(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 70
LDI r2, 267
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
