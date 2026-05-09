; DESCRIPTION: Renders a white line between points (162, 81) and (10, 118).
; PLAN: r0=162(x1), r1=81(y1), r2=10(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 81
LDI r2, 10
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
