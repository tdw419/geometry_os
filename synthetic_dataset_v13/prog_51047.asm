; DESCRIPTION: Draws a purple line from (291, 233) to (91, 22).
; PLAN: r0=291(x1), r1=233(y1), r2=91(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 233
LDI r2, 91
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
