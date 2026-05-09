; DESCRIPTION: Draws a yellow line from (14, 114) to (133, 214).
; PLAN: r0=14(x1), r1=114(y1), r2=133(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 114
LDI r2, 133
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
