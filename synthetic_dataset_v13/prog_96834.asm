; DESCRIPTION: Renders a white line between points (504, 47) and (411, 119).
; PLAN: r0=504(x1), r1=47(y1), r2=411(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 47
LDI r2, 411
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
