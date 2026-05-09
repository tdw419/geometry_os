; DESCRIPTION: Renders a white line between points (253, 238) and (205, 185).
; PLAN: r0=253(x1), r1=238(y1), r2=205(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 238
LDI r2, 205
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
