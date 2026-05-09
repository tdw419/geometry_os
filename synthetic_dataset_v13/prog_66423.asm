; DESCRIPTION: Renders a white line between points (252, 158) and (483, 50).
; PLAN: r0=252(x1), r1=158(y1), r2=483(x2), r3=50(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 158
LDI r2, 483
LDI r3, 50
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
