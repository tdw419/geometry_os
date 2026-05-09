; DESCRIPTION: Renders a red line between points (390, 15) and (134, 127).
; PLAN: r0=390(x1), r1=15(y1), r2=134(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 15
LDI r2, 134
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
