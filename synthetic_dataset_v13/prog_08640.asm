; DESCRIPTION: Draws a purple line from (455, 57) to (288, 109).
; PLAN: r0=455(x1), r1=57(y1), r2=288(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 57
LDI r2, 288
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
