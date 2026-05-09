; DESCRIPTION: Renders a white line between points (61, 179) and (88, 3).
; PLAN: r0=61(x1), r1=179(y1), r2=88(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 179
LDI r2, 88
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
