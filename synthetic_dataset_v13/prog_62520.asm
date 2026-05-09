; DESCRIPTION: Renders a white line between points (357, 156) and (98, 186).
; PLAN: r0=357(x1), r1=156(y1), r2=98(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 156
LDI r2, 98
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
