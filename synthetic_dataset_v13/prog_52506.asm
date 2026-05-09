; DESCRIPTION: Places a red line segment connecting (349, 104) to (478, 165).
; PLAN: r0=349(x1), r1=104(y1), r2=478(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 104
LDI r2, 478
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
