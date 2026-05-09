; DESCRIPTION: Draws a yellow line from (262, 153) to (52, 36).
; PLAN: r0=262(x1), r1=153(y1), r2=52(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 153
LDI r2, 52
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
