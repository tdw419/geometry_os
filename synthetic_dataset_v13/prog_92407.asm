; DESCRIPTION: Renders a black line between points (93, 125) and (54, 247).
; PLAN: r0=93(x1), r1=125(y1), r2=54(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 125
LDI r2, 54
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
