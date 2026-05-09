; DESCRIPTION: Renders a purple line between points (304, 38) and (411, 9).
; PLAN: r0=304(x1), r1=38(y1), r2=411(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 38
LDI r2, 411
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
