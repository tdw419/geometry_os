; DESCRIPTION: Renders a red line between points (361, 54) and (379, 177).
; PLAN: r0=361(x1), r1=54(y1), r2=379(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 54
LDI r2, 379
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
