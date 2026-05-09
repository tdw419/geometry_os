; DESCRIPTION: Renders a white line between points (139, 61) and (226, 60).
; PLAN: r0=139(x1), r1=61(y1), r2=226(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 61
LDI r2, 226
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
