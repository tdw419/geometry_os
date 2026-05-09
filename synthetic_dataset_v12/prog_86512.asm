; DESCRIPTION: Renders a white line between points (181, 243) and (379, 68).
; PLAN: r0=181(x1), r1=243(y1), r2=379(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 243
LDI r2, 379
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
