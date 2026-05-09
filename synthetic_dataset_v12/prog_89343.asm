; DESCRIPTION: Renders a purple line between points (175, 88) and (127, 54).
; PLAN: r0=175(x1), r1=88(y1), r2=127(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 88
LDI r2, 127
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
