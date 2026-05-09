; DESCRIPTION: Renders a purple line between points (499, 58) and (129, 151).
; PLAN: r0=499(x1), r1=58(y1), r2=129(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 58
LDI r2, 129
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
