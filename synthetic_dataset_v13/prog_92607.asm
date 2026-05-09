; DESCRIPTION: Renders a white line between points (112, 11) and (116, 221).
; PLAN: r0=112(x1), r1=11(y1), r2=116(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 11
LDI r2, 116
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
