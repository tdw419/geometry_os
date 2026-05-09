; DESCRIPTION: Renders a purple line between points (175, 224) and (420, 22).
; PLAN: r0=175(x1), r1=224(y1), r2=420(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 224
LDI r2, 420
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
