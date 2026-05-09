; DESCRIPTION: Renders a purple line between points (475, 49) and (8, 171).
; PLAN: r0=475(x1), r1=49(y1), r2=8(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 49
LDI r2, 8
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
