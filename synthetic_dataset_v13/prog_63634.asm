; DESCRIPTION: Renders a orange line between points (220, 29) and (342, 255).
; PLAN: r0=220(x1), r1=29(y1), r2=342(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 29
LDI r2, 342
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
