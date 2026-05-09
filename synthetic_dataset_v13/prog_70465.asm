; DESCRIPTION: Renders a red line between points (467, 126) and (427, 129).
; PLAN: r0=467(x1), r1=126(y1), r2=427(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 126
LDI r2, 427
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
