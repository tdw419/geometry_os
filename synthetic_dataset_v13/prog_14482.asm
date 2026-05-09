; DESCRIPTION: Renders a white line between points (316, 141) and (140, 230).
; PLAN: r0=316(x1), r1=141(y1), r2=140(x2), r3=230(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 141
LDI r2, 140
LDI r3, 230
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
