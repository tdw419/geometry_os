; DESCRIPTION: Draws a yellow line from (334, 86) to (377, 118).
; PLAN: r0=334(x1), r1=86(y1), r2=377(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 86
LDI r2, 377
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
