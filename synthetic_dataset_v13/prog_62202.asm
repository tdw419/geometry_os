; DESCRIPTION: Renders a white line between points (345, 179) and (439, 199).
; PLAN: r0=345(x1), r1=179(y1), r2=439(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 179
LDI r2, 439
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
