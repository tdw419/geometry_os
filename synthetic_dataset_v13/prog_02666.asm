; DESCRIPTION: Renders a white line between points (24, 61) and (194, 121).
; PLAN: r0=24(x1), r1=61(y1), r2=194(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 61
LDI r2, 194
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
