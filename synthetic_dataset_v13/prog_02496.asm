; DESCRIPTION: Renders a white line between points (147, 133) and (190, 229).
; PLAN: r0=147(x1), r1=133(y1), r2=190(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 133
LDI r2, 190
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
