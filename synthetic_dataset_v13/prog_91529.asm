; DESCRIPTION: Renders a white line between points (241, 2) and (189, 75).
; PLAN: r0=241(x1), r1=2(y1), r2=189(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 2
LDI r2, 189
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
