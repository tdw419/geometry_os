; DESCRIPTION: Renders a black line between points (309, 7) and (467, 118).
; PLAN: r0=309(x1), r1=7(y1), r2=467(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 7
LDI r2, 467
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
