; DESCRIPTION: Renders a purple line between points (395, 108) and (416, 219).
; PLAN: r0=395(x1), r1=108(y1), r2=416(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 108
LDI r2, 416
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
