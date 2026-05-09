; DESCRIPTION: Renders a purple line between points (346, 130) and (346, 85).
; PLAN: r0=346(x1), r1=130(y1), r2=346(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 130
LDI r2, 346
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
