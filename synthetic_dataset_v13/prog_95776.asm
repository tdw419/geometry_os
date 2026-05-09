; DESCRIPTION: Renders a orange line between points (136, 107) and (179, 171).
; PLAN: r0=136(x1), r1=107(y1), r2=179(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 107
LDI r2, 179
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
