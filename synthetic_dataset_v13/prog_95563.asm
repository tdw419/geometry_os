; DESCRIPTION: Renders a orange line between points (29, 255) and (497, 20).
; PLAN: r0=29(x1), r1=255(y1), r2=497(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 255
LDI r2, 497
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
