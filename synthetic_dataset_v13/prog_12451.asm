; DESCRIPTION: Renders a white line between points (491, 15) and (379, 144).
; PLAN: r0=491(x1), r1=15(y1), r2=379(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 15
LDI r2, 379
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
