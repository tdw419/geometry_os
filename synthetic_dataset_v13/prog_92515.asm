; DESCRIPTION: Renders a purple line between points (332, 121) and (277, 141).
; PLAN: r0=332(x1), r1=121(y1), r2=277(x2), r3=141(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 121
LDI r2, 277
LDI r3, 141
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
