; DESCRIPTION: Renders a purple line between points (41, 230) and (255, 101).
; PLAN: r0=41(x1), r1=230(y1), r2=255(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 230
LDI r2, 255
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
