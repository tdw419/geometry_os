; DESCRIPTION: Draws a yellow line from (105, 13) to (262, 246).
; PLAN: r0=105(x1), r1=13(y1), r2=262(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 13
LDI r2, 262
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
