; DESCRIPTION: Renders a white line between points (5, 20) and (119, 4).
; PLAN: r0=5(x1), r1=20(y1), r2=119(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 20
LDI r2, 119
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
