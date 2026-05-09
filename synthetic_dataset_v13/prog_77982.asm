; DESCRIPTION: Renders a white line between points (3, 186) and (55, 238).
; PLAN: r0=3(x1), r1=186(y1), r2=55(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 186
LDI r2, 55
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
