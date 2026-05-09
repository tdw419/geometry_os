; DESCRIPTION: Draws a red line from (507, 84) to (310, 251).
; PLAN: r0=507(x1), r1=84(y1), r2=310(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 84
LDI r2, 310
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
