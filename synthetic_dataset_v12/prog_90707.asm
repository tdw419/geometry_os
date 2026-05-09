; DESCRIPTION: Draws a yellow line from (313, 216) to (179, 219).
; PLAN: r0=313(x1), r1=216(y1), r2=179(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 216
LDI r2, 179
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
