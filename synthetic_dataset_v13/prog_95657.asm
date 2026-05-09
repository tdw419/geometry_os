; DESCRIPTION: Renders a white line between points (379, 159) and (439, 229).
; PLAN: r0=379(x1), r1=159(y1), r2=439(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 159
LDI r2, 439
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
