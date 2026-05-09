; DESCRIPTION: Renders a white line between points (79, 163) and (147, 26).
; PLAN: r0=79(x1), r1=163(y1), r2=147(x2), r3=26(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 163
LDI r2, 147
LDI r3, 26
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
