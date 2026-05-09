; DESCRIPTION: Renders a white line between points (97, 94) and (379, 10).
; PLAN: r0=97(x1), r1=94(y1), r2=379(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 94
LDI r2, 379
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
