; DESCRIPTION: Renders a purple line between points (341, 120) and (213, 100).
; PLAN: r0=341(x1), r1=120(y1), r2=213(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 120
LDI r2, 213
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
