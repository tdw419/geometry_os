; DESCRIPTION: Renders a purple line between points (333, 177) and (44, 114).
; PLAN: r0=333(x1), r1=177(y1), r2=44(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 177
LDI r2, 44
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
