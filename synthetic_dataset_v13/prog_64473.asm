; DESCRIPTION: Renders a green line between points (276, 211) and (55, 217).
; PLAN: r0=276(x1), r1=211(y1), r2=55(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 211
LDI r2, 55
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
