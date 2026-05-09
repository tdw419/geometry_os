; DESCRIPTION: Renders a purple line between points (320, 76) and (453, 61).
; PLAN: r0=320(x1), r1=76(y1), r2=453(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 76
LDI r2, 453
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
