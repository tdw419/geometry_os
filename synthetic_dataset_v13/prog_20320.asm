; DESCRIPTION: Draws a yellow line from (117, 216) to (225, 36).
; PLAN: r0=117(x1), r1=216(y1), r2=225(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 216
LDI r2, 225
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
