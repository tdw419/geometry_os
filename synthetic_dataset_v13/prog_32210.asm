; DESCRIPTION: Renders a purple line between points (62, 238) and (281, 178).
; PLAN: r0=62(x1), r1=238(y1), r2=281(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 238
LDI r2, 281
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
