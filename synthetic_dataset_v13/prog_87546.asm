; DESCRIPTION: Renders a white line between points (110, 115) and (375, 169).
; PLAN: r0=110(x1), r1=115(y1), r2=375(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 115
LDI r2, 375
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
