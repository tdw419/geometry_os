; DESCRIPTION: Renders a purple line between points (224, 157) and (329, 63).
; PLAN: r0=224(x1), r1=157(y1), r2=329(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 157
LDI r2, 329
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
