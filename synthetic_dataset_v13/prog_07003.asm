; DESCRIPTION: Renders a white line between points (93, 138) and (253, 158).
; PLAN: r0=93(x1), r1=138(y1), r2=253(x2), r3=158(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 138
LDI r2, 253
LDI r3, 158
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
