; DESCRIPTION: Renders a red line between points (393, 206) and (112, 211).
; PLAN: r0=393(x1), r1=206(y1), r2=112(x2), r3=211(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 206
LDI r2, 112
LDI r3, 211
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
