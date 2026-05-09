; DESCRIPTION: Renders a red line between points (222, 177) and (252, 232).
; PLAN: r0=222(x1), r1=177(y1), r2=252(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 177
LDI r2, 252
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
