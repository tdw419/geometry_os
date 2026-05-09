; DESCRIPTION: Renders a purple line between points (175, 13) and (374, 56).
; PLAN: r0=175(x1), r1=13(y1), r2=374(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 13
LDI r2, 374
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
