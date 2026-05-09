; DESCRIPTION: Renders a white line between points (232, 171) and (314, 207).
; PLAN: r0=232(x1), r1=171(y1), r2=314(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 171
LDI r2, 314
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
