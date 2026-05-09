; DESCRIPTION: Renders a red line between points (177, 22) and (296, 5).
; PLAN: r0=177(x1), r1=22(y1), r2=296(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 22
LDI r2, 296
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
