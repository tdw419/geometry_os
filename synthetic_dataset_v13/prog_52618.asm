; DESCRIPTION: Renders a purple line between points (467, 192) and (474, 0).
; PLAN: r0=467(x1), r1=192(y1), r2=474(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 192
LDI r2, 474
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
