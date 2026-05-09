; DESCRIPTION: Renders a purple line between points (171, 74) and (278, 230).
; PLAN: r0=171(x1), r1=74(y1), r2=278(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 74
LDI r2, 278
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
