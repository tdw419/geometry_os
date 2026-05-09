; DESCRIPTION: Renders a orange line between points (142, 141) and (90, 93).
; PLAN: r0=142(x1), r1=141(y1), r2=90(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 141
LDI r2, 90
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
