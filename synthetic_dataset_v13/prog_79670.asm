; DESCRIPTION: Renders a white line between points (430, 87) and (136, 34).
; PLAN: r0=430(x1), r1=87(y1), r2=136(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 87
LDI r2, 136
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
