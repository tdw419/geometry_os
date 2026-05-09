; DESCRIPTION: Renders a white line between points (439, 167) and (153, 79).
; PLAN: r0=439(x1), r1=167(y1), r2=153(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 167
LDI r2, 153
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
