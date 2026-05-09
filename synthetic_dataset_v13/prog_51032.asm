; DESCRIPTION: Draws a yellow line from (209, 1) to (292, 165).
; PLAN: r0=209(x1), r1=1(y1), r2=292(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 1
LDI r2, 292
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
