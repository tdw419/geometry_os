; DESCRIPTION: Renders a purple line between points (455, 19) and (258, 114).
; PLAN: r0=455(x1), r1=19(y1), r2=258(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 19
LDI r2, 258
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
