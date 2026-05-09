; DESCRIPTION: Renders a red line between points (482, 140) and (192, 241).
; PLAN: r0=482(x1), r1=140(y1), r2=192(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 140
LDI r2, 192
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
