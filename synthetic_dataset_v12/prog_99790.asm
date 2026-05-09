; DESCRIPTION: Renders a purple line between points (58, 238) and (179, 221).
; PLAN: r0=58(x1), r1=238(y1), r2=179(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 238
LDI r2, 179
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
