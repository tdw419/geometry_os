; DESCRIPTION: Renders a white line between points (119, 75) and (311, 30).
; PLAN: r0=119(x1), r1=75(y1), r2=311(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 75
LDI r2, 311
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
