; DESCRIPTION: Renders a white line between points (86, 81) and (379, 235).
; PLAN: r0=86(x1), r1=81(y1), r2=379(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 81
LDI r2, 379
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
