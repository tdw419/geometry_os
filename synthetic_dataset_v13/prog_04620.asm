; DESCRIPTION: Renders a purple line between points (390, 175) and (397, 84).
; PLAN: r0=390(x1), r1=175(y1), r2=397(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 175
LDI r2, 397
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
