; DESCRIPTION: Draws a yellow line from (29, 28) to (292, 47).
; PLAN: r0=29(x1), r1=28(y1), r2=292(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 28
LDI r2, 292
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
