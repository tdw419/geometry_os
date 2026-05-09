; DESCRIPTION: Renders a black line between points (226, 205) and (379, 119).
; PLAN: r0=226(x1), r1=205(y1), r2=379(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 205
LDI r2, 379
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
