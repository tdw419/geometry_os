; DESCRIPTION: Renders a white line between points (475, 206) and (129, 119).
; PLAN: r0=475(x1), r1=206(y1), r2=129(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 206
LDI r2, 129
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
