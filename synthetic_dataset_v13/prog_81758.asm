; DESCRIPTION: Renders a white line between points (104, 192) and (276, 201).
; PLAN: r0=104(x1), r1=192(y1), r2=276(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 192
LDI r2, 276
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
