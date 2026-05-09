; DESCRIPTION: Renders a white line between points (376, 82) and (189, 124).
; PLAN: r0=376(x1), r1=82(y1), r2=189(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 82
LDI r2, 189
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
