; DESCRIPTION: Renders a purple line between points (256, 20) and (128, 40).
; PLAN: r0=256(x1), r1=20(y1), r2=128(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 20
LDI r2, 128
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
