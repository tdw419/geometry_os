; DESCRIPTION: Renders a white line between points (253, 104) and (276, 101).
; PLAN: r0=253(x1), r1=104(y1), r2=276(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 104
LDI r2, 276
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
