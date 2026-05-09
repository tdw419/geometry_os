; DESCRIPTION: Draws a black line from (22, 91) to (67, 217).
; PLAN: r0=22(x1), r1=91(y1), r2=67(x2), r3=217(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 91
LDI r2, 67
LDI r3, 217
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
