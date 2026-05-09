; DESCRIPTION: Renders a black line between points (339, 192) and (238, 144).
; PLAN: r0=339(x1), r1=192(y1), r2=238(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 192
LDI r2, 238
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
