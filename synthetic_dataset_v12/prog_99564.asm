; DESCRIPTION: Renders a purple line between points (114, 221) and (384, 88).
; PLAN: r0=114(x1), r1=221(y1), r2=384(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 221
LDI r2, 384
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
