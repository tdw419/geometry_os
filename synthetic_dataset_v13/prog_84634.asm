; DESCRIPTION: Renders a white line between points (373, 179) and (351, 176).
; PLAN: r0=373(x1), r1=179(y1), r2=351(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 179
LDI r2, 351
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
