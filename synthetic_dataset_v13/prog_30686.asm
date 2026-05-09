; DESCRIPTION: Places a purple line segment connecting (426, 168) to (416, 203).
; PLAN: r0=426(x1), r1=168(y1), r2=416(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 168
LDI r2, 416
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
