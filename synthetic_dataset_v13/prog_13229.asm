; DESCRIPTION: Renders a purple line between points (144, 73) and (17, 18).
; PLAN: r0=144(x1), r1=73(y1), r2=17(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 73
LDI r2, 17
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
