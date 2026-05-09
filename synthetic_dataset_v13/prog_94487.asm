; DESCRIPTION: Draws a purple line from (111, 55) to (216, 202).
; PLAN: r0=111(x1), r1=55(y1), r2=216(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 55
LDI r2, 216
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
