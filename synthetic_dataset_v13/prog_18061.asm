; DESCRIPTION: Renders a red line between points (351, 223) and (498, 47).
; PLAN: r0=351(x1), r1=223(y1), r2=498(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 223
LDI r2, 498
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
