; DESCRIPTION: Renders a white line between points (159, 238) and (303, 94).
; PLAN: r0=159(x1), r1=238(y1), r2=303(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 238
LDI r2, 303
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
