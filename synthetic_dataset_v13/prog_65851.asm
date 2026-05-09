; DESCRIPTION: Renders a blue line between points (126, 192) and (118, 12).
; PLAN: r0=126(x1), r1=192(y1), r2=118(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 192
LDI r2, 118
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
