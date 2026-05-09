; DESCRIPTION: Draws a red line from (478, 38) to (435, 122).
; PLAN: r0=478(x1), r1=38(y1), r2=435(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 38
LDI r2, 435
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
