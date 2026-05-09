; DESCRIPTION: Renders a green line between points (439, 125) and (11, 104).
; PLAN: r0=439(x1), r1=125(y1), r2=11(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 125
LDI r2, 11
LDI r3, 104
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
