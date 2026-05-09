; DESCRIPTION: Renders a white line between points (466, 164) and (194, 179).
; PLAN: r0=466(x1), r1=164(y1), r2=194(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 164
LDI r2, 194
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
