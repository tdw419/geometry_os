; DESCRIPTION: Renders a white line between points (104, 82) and (182, 169).
; PLAN: r0=104(x1), r1=82(y1), r2=182(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 82
LDI r2, 182
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
