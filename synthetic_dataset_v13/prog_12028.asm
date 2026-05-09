; DESCRIPTION: Renders a blue line between points (379, 57) and (376, 178).
; PLAN: r0=379(x1), r1=57(y1), r2=376(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 57
LDI r2, 376
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
