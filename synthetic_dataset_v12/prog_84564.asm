; DESCRIPTION: Renders a white line between points (478, 6) and (125, 175).
; PLAN: r0=478(x1), r1=6(y1), r2=125(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 6
LDI r2, 125
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
