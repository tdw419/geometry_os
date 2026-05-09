; DESCRIPTION: Draws a yellow line from (155, 2) to (339, 171).
; PLAN: r0=155(x1), r1=2(y1), r2=339(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 2
LDI r2, 339
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
