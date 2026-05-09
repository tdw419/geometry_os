; DESCRIPTION: Renders a blue line between points (6, 78) and (276, 142).
; PLAN: r0=6(x1), r1=78(y1), r2=276(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 78
LDI r2, 276
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
