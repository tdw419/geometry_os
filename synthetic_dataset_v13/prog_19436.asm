; DESCRIPTION: Renders a white line between points (321, 177) and (85, 233).
; PLAN: r0=321(x1), r1=177(y1), r2=85(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 177
LDI r2, 85
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
