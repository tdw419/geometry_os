; DESCRIPTION: Renders a purple line between points (378, 95) and (59, 184).
; PLAN: r0=378(x1), r1=95(y1), r2=59(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 95
LDI r2, 59
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
