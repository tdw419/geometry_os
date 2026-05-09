; DESCRIPTION: Renders a red line between points (478, 217) and (265, 27).
; PLAN: r0=478(x1), r1=217(y1), r2=265(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 217
LDI r2, 265
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
