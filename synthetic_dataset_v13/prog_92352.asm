; DESCRIPTION: Renders a purple line between points (86, 246) and (346, 99).
; PLAN: r0=86(x1), r1=246(y1), r2=346(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 246
LDI r2, 346
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
