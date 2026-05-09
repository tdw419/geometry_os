; DESCRIPTION: Renders a white line between points (177, 116) and (305, 53).
; PLAN: r0=177(x1), r1=116(y1), r2=305(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 116
LDI r2, 305
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
