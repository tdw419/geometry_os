; DESCRIPTION: Renders a white line between points (274, 119) and (411, 59).
; PLAN: r0=274(x1), r1=119(y1), r2=411(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 119
LDI r2, 411
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
