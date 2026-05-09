; DESCRIPTION: Renders a orange line between points (220, 83) and (114, 75).
; PLAN: r0=220(x1), r1=83(y1), r2=114(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 83
LDI r2, 114
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
