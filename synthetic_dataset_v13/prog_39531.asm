; DESCRIPTION: Renders a white line between points (119, 159) and (137, 61).
; PLAN: r0=119(x1), r1=159(y1), r2=137(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 159
LDI r2, 137
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
