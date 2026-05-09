; DESCRIPTION: Draws a yellow line from (247, 238) to (88, 58).
; PLAN: r0=247(x1), r1=238(y1), r2=88(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 238
LDI r2, 88
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
