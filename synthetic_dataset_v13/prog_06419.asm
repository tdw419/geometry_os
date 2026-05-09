; DESCRIPTION: Renders a purple line between points (297, 221) and (505, 21).
; PLAN: r0=297(x1), r1=221(y1), r2=505(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 221
LDI r2, 505
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
