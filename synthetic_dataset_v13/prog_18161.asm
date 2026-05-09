; DESCRIPTION: Draws a yellow line from (396, 247) to (74, 3).
; PLAN: r0=396(x1), r1=247(y1), r2=74(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 247
LDI r2, 74
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
