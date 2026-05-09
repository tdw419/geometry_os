; DESCRIPTION: Renders a purple line between points (498, 26) and (38, 167).
; PLAN: r0=498(x1), r1=26(y1), r2=38(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 26
LDI r2, 38
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
