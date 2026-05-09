; DESCRIPTION: Renders a yellow line between points (140, 212) and (341, 82).
; PLAN: r0=140(x1), r1=212(y1), r2=341(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 212
LDI r2, 341
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
