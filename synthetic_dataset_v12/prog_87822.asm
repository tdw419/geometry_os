; DESCRIPTION: Renders a purple line between points (32, 235) and (224, 37).
; PLAN: r0=32(x1), r1=235(y1), r2=224(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 235
LDI r2, 224
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
