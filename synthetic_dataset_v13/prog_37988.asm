; DESCRIPTION: Draws a yellow line from (262, 96) to (285, 8).
; PLAN: r0=262(x1), r1=96(y1), r2=285(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 96
LDI r2, 285
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
