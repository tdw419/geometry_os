; DESCRIPTION: Renders a purple line between points (80, 172) and (224, 191).
; PLAN: r0=80(x1), r1=172(y1), r2=224(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 172
LDI r2, 224
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
