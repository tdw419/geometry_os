; DESCRIPTION: Draws a yellow line from (148, 222) to (101, 216).
; PLAN: r0=148(x1), r1=222(y1), r2=101(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 222
LDI r2, 101
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
