; DESCRIPTION: Renders a magenta line between points (379, 104) and (140, 189).
; PLAN: r0=379(x1), r1=104(y1), r2=140(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 104
LDI r2, 140
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
