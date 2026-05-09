; DESCRIPTION: Renders a red line between points (469, 54) and (436, 251).
; PLAN: r0=469(x1), r1=54(y1), r2=436(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 54
LDI r2, 436
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
