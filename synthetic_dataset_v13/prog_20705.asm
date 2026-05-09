; DESCRIPTION: Renders a purple line between points (379, 53) and (134, 209).
; PLAN: r0=379(x1), r1=53(y1), r2=134(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 53
LDI r2, 134
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
