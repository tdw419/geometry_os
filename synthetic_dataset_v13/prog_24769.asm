; DESCRIPTION: Draws a black line from (72, 216) to (260, 88).
; PLAN: r0=72(x1), r1=216(y1), r2=260(x2), r3=88(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 216
LDI r2, 260
LDI r3, 88
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
