; DESCRIPTION: Renders a red line between points (351, 83) and (499, 159).
; PLAN: r0=351(x1), r1=83(y1), r2=499(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 83
LDI r2, 499
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
