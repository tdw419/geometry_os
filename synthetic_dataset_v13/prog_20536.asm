; DESCRIPTION: Renders a red line between points (379, 115) and (486, 186).
; PLAN: r0=379(x1), r1=115(y1), r2=486(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 115
LDI r2, 486
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
