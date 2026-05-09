; DESCRIPTION: Draws a purple line from (161, 130) to (372, 135).
; PLAN: r0=161(x1), r1=130(y1), r2=372(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 130
LDI r2, 372
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
