; DESCRIPTION: Draws a yellow line from (469, 216) to (68, 226).
; PLAN: r0=469(x1), r1=216(y1), r2=68(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 216
LDI r2, 68
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
