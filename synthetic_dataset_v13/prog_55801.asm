; DESCRIPTION: Renders a purple line between points (316, 86) and (113, 55).
; PLAN: r0=316(x1), r1=86(y1), r2=113(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 86
LDI r2, 113
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
