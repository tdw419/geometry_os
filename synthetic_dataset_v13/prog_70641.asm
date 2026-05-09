; DESCRIPTION: Renders a white line between points (102, 78) and (439, 32).
; PLAN: r0=102(x1), r1=78(y1), r2=439(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 78
LDI r2, 439
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
