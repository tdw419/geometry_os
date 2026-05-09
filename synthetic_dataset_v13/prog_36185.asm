; DESCRIPTION: Renders a purple line between points (99, 230) and (457, 209).
; PLAN: r0=99(x1), r1=230(y1), r2=457(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 230
LDI r2, 457
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
