; DESCRIPTION: Renders a purple line between points (458, 33) and (119, 16).
; PLAN: r0=458(x1), r1=33(y1), r2=119(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 33
LDI r2, 119
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
