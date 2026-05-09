; DESCRIPTION: Draws a yellow line from (395, 151) to (158, 24).
; PLAN: r0=395(x1), r1=151(y1), r2=158(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 151
LDI r2, 158
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
