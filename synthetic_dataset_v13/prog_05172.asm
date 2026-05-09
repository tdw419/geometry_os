; DESCRIPTION: Renders a blue line between points (493, 108) and (379, 183).
; PLAN: r0=493(x1), r1=108(y1), r2=379(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 108
LDI r2, 379
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
