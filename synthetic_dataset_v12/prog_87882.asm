; DESCRIPTION: Draws a yellow line from (384, 95) to (118, 153).
; PLAN: r0=384(x1), r1=95(y1), r2=118(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 95
LDI r2, 118
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
