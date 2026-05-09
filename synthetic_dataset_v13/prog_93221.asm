; DESCRIPTION: Draws a yellow line from (424, 135) to (37, 153).
; PLAN: r0=424(x1), r1=135(y1), r2=37(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 135
LDI r2, 37
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
