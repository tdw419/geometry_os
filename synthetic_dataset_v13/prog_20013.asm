; DESCRIPTION: Renders a purple line between points (43, 192) and (262, 249).
; PLAN: r0=43(x1), r1=192(y1), r2=262(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 192
LDI r2, 262
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
