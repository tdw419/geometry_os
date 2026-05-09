; DESCRIPTION: Renders a purple line between points (370, 86) and (153, 115).
; PLAN: r0=370(x1), r1=86(y1), r2=153(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 86
LDI r2, 153
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
