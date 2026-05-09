; DESCRIPTION: Renders a white line between points (250, 50) and (142, 11).
; PLAN: r0=250(x1), r1=50(y1), r2=142(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 50
LDI r2, 142
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
