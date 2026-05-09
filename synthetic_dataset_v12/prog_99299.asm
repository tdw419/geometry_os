; DESCRIPTION: Renders a white line between points (424, 65) and (478, 230).
; PLAN: r0=424(x1), r1=65(y1), r2=478(x2), r3=230(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 65
LDI r2, 478
LDI r3, 230
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
