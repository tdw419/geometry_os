; DESCRIPTION: Renders a purple line between points (345, 22) and (53, 104).
; PLAN: r0=345(x1), r1=22(y1), r2=53(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 22
LDI r2, 53
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
