; DESCRIPTION: Draws a yellow line from (191, 157) to (29, 118).
; PLAN: r0=191(x1), r1=157(y1), r2=29(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 157
LDI r2, 29
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
