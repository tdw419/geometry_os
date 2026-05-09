; DESCRIPTION: Renders a purple line between points (146, 114) and (172, 224).
; PLAN: r0=146(x1), r1=114(y1), r2=172(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 114
LDI r2, 172
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
