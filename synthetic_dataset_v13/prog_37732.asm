; DESCRIPTION: Draws a red line from (129, 251) to (494, 119).
; PLAN: r0=129(x1), r1=251(y1), r2=494(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 251
LDI r2, 494
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
