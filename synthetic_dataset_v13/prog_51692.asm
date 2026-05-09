; DESCRIPTION: Renders a purple line between points (97, 57) and (455, 187).
; PLAN: r0=97(x1), r1=57(y1), r2=455(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 57
LDI r2, 455
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
