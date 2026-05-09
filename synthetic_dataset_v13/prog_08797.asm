; DESCRIPTION: Renders a purple line between points (175, 7) and (320, 40).
; PLAN: r0=175(x1), r1=7(y1), r2=320(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 7
LDI r2, 320
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
