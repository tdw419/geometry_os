; DESCRIPTION: Draws a yellow line from (13, 92) to (81, 193).
; PLAN: r0=13(x1), r1=92(y1), r2=81(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 92
LDI r2, 81
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
