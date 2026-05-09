; DESCRIPTION: Draws a yellow line from (103, 162) to (377, 246).
; PLAN: r0=103(x1), r1=162(y1), r2=377(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 162
LDI r2, 377
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
