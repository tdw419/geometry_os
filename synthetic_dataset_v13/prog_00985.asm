; DESCRIPTION: Draws a yellow line from (457, 14) to (115, 170).
; PLAN: r0=457(x1), r1=14(y1), r2=115(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 14
LDI r2, 115
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
