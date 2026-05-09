; DESCRIPTION: Renders a white line between points (207, 1) and (147, 148).
; PLAN: r0=207(x1), r1=1(y1), r2=147(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 1
LDI r2, 147
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
