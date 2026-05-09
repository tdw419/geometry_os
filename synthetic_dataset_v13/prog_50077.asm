; DESCRIPTION: Renders a purple line between points (195, 130) and (190, 48).
; PLAN: r0=195(x1), r1=130(y1), r2=190(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 130
LDI r2, 190
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
