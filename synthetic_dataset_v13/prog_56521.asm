; DESCRIPTION: Renders a white line between points (89, 5) and (66, 158).
; PLAN: r0=89(x1), r1=5(y1), r2=66(x2), r3=158(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 5
LDI r2, 66
LDI r3, 158
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
