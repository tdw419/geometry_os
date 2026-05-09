; DESCRIPTION: Renders a purple line between points (366, 182) and (304, 115).
; PLAN: r0=366(x1), r1=182(y1), r2=304(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 182
LDI r2, 304
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
