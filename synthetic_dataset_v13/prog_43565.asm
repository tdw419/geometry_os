; DESCRIPTION: Renders a white line between points (439, 186) and (131, 137).
; PLAN: r0=439(x1), r1=186(y1), r2=131(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 186
LDI r2, 131
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
