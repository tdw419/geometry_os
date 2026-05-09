; DESCRIPTION: Draws a yellow line from (81, 72) to (57, 101).
; PLAN: r0=81(x1), r1=72(y1), r2=57(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 72
LDI r2, 57
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
