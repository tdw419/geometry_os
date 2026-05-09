; DESCRIPTION: Renders a red line between points (274, 83) and (453, 176).
; PLAN: r0=274(x1), r1=83(y1), r2=453(x2), r3=176(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 83
LDI r2, 453
LDI r3, 176
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
