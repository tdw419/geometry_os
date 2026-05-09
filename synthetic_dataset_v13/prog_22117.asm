; DESCRIPTION: Draws a yellow line from (7, 103) to (53, 214).
; PLAN: r0=7(x1), r1=103(y1), r2=53(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 103
LDI r2, 53
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
