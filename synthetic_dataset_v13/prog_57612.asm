; DESCRIPTION: Renders a red line between points (82, 172) and (379, 251).
; PLAN: r0=82(x1), r1=172(y1), r2=379(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 172
LDI r2, 379
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
