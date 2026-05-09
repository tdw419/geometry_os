; DESCRIPTION: Renders a purple line between points (416, 39) and (385, 30).
; PLAN: r0=416(x1), r1=39(y1), r2=385(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 39
LDI r2, 385
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
