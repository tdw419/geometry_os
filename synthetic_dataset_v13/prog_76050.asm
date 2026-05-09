; DESCRIPTION: Draws a purple line from (258, 22) to (450, 88).
; PLAN: r0=258(x1), r1=22(y1), r2=450(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 22
LDI r2, 450
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
