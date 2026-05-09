; DESCRIPTION: Renders a black line between points (114, 79) and (93, 118).
; PLAN: r0=114(x1), r1=79(y1), r2=93(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 79
LDI r2, 93
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
