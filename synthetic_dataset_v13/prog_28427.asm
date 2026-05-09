; DESCRIPTION: Renders a red line between points (436, 115) and (283, 251).
; PLAN: r0=436(x1), r1=115(y1), r2=283(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 115
LDI r2, 283
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
