; DESCRIPTION: Renders a purple line between points (482, 237) and (112, 34).
; PLAN: r0=482(x1), r1=237(y1), r2=112(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 237
LDI r2, 112
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
