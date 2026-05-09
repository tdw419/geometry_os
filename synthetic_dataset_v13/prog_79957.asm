; DESCRIPTION: Renders a red line between points (413, 166) and (379, 186).
; PLAN: r0=413(x1), r1=166(y1), r2=379(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 166
LDI r2, 379
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
