; DESCRIPTION: Draws a yellow line from (403, 20) to (96, 118).
; PLAN: r0=403(x1), r1=20(y1), r2=96(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 20
LDI r2, 96
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
