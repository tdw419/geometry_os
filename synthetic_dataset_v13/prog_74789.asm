; DESCRIPTION: Renders a white line between points (85, 177) and (278, 163).
; PLAN: r0=85(x1), r1=177(y1), r2=278(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 177
LDI r2, 278
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
