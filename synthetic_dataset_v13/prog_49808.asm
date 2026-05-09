; DESCRIPTION: Renders a white line between points (358, 165) and (177, 116).
; PLAN: r0=358(x1), r1=165(y1), r2=177(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 165
LDI r2, 177
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
