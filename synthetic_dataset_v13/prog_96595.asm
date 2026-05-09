; DESCRIPTION: Renders a red line between points (220, 225) and (351, 188).
; PLAN: r0=220(x1), r1=225(y1), r2=351(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 225
LDI r2, 351
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
