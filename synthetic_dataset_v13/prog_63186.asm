; DESCRIPTION: Renders a white line between points (447, 83) and (351, 241).
; PLAN: r0=447(x1), r1=83(y1), r2=351(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 83
LDI r2, 351
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
