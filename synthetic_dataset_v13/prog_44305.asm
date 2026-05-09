; DESCRIPTION: Renders a purple line between points (297, 236) and (418, 139).
; PLAN: r0=297(x1), r1=236(y1), r2=418(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 236
LDI r2, 418
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
