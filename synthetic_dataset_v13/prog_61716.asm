; DESCRIPTION: Renders a red line between points (251, 204) and (382, 248).
; PLAN: r0=251(x1), r1=204(y1), r2=382(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 204
LDI r2, 382
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
