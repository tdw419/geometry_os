; DESCRIPTION: Renders a green line between points (379, 250) and (1, 81).
; PLAN: r0=379(x1), r1=250(y1), r2=1(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 250
LDI r2, 1
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
