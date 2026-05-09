; DESCRIPTION: Draws a yellow line from (58, 243) to (505, 23).
; PLAN: r0=58(x1), r1=243(y1), r2=505(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 243
LDI r2, 505
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
