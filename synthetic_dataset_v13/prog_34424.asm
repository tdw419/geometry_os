; DESCRIPTION: Draws a yellow line from (88, 15) to (385, 146).
; PLAN: r0=88(x1), r1=15(y1), r2=385(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 15
LDI r2, 385
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
