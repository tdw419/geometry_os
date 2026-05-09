; DESCRIPTION: Renders a white line between points (186, 189) and (364, 98).
; PLAN: r0=186(x1), r1=189(y1), r2=364(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 189
LDI r2, 364
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
