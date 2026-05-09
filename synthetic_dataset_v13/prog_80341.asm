; DESCRIPTION: Draws a yellow line from (0, 75) to (81, 67).
; PLAN: r0=0(x1), r1=75(y1), r2=81(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 75
LDI r2, 81
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
