; DESCRIPTION: Draws a white line from (339, 155) to (238, 83).
; PLAN: r0=339(x1), r1=155(y1), r2=238(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 155
LDI r2, 238
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
