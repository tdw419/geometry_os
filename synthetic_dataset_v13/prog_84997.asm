; DESCRIPTION: Draws a white line from (324, 53) to (478, 194).
; PLAN: r0=324(x1), r1=53(y1), r2=478(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 53
LDI r2, 478
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
