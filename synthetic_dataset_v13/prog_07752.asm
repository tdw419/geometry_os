; DESCRIPTION: Renders a white line between points (75, 101) and (191, 81).
; PLAN: r0=75(x1), r1=101(y1), r2=191(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 101
LDI r2, 191
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
