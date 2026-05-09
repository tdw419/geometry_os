; DESCRIPTION: Renders a white line between points (47, 80) and (130, 84).
; PLAN: r0=47(x1), r1=80(y1), r2=130(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 80
LDI r2, 130
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
