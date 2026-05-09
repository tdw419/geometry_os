; DESCRIPTION: Renders a purple line between points (488, 189) and (364, 14).
; PLAN: r0=488(x1), r1=189(y1), r2=364(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 189
LDI r2, 364
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
