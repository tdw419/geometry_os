; DESCRIPTION: Renders a purple line between points (175, 164) and (319, 56).
; PLAN: r0=175(x1), r1=164(y1), r2=319(x2), r3=56(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 164
LDI r2, 319
LDI r3, 56
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
