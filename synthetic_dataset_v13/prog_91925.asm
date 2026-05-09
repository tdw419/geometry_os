; DESCRIPTION: Renders a purple line between points (501, 16) and (467, 135).
; PLAN: r0=501(x1), r1=16(y1), r2=467(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 16
LDI r2, 467
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
