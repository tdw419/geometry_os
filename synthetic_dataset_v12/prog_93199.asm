; DESCRIPTION: Renders a white line between points (155, 179) and (493, 3).
; PLAN: r0=155(x1), r1=179(y1), r2=493(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 179
LDI r2, 493
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
