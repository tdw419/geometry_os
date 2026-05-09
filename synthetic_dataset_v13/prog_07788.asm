; DESCRIPTION: Renders a white line between points (96, 77) and (179, 194).
; PLAN: r0=96(x1), r1=77(y1), r2=179(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 77
LDI r2, 179
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
