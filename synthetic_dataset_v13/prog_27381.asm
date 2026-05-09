; DESCRIPTION: Draws a black line from (58, 216) to (58, 137).
; PLAN: r0=58(x1), r1=216(y1), r2=58(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 216
LDI r2, 58
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
