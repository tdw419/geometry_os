; DESCRIPTION: Renders a red line between points (427, 225) and (274, 37).
; PLAN: r0=427(x1), r1=225(y1), r2=274(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 225
LDI r2, 274
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
