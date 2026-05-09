; DESCRIPTION: Renders a purple line between points (175, 122) and (96, 70).
; PLAN: r0=175(x1), r1=122(y1), r2=96(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 122
LDI r2, 96
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
