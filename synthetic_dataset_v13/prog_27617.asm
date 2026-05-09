; DESCRIPTION: Renders a purple line between points (488, 182) and (435, 123).
; PLAN: r0=488(x1), r1=182(y1), r2=435(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 182
LDI r2, 435
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
