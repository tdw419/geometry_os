; DESCRIPTION: Draws a yellow line from (88, 151) to (357, 96).
; PLAN: r0=88(x1), r1=151(y1), r2=357(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 151
LDI r2, 357
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
