; DESCRIPTION: Renders a purple line between points (30, 135) and (411, 176).
; PLAN: r0=30(x1), r1=135(y1), r2=411(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 135
LDI r2, 411
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
