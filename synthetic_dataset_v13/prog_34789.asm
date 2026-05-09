; DESCRIPTION: Renders a purple line between points (482, 66) and (202, 238).
; PLAN: r0=482(x1), r1=66(y1), r2=202(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 66
LDI r2, 202
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
