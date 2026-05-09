; DESCRIPTION: Renders a black line between points (31, 241) and (316, 204).
; PLAN: r0=31(x1), r1=241(y1), r2=316(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 241
LDI r2, 316
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
