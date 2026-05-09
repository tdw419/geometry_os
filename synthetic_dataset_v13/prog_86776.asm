; DESCRIPTION: Renders a green line between points (244, 182) and (166, 116).
; PLAN: r0=244(x1), r1=182(y1), r2=166(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 182
LDI r2, 166
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
