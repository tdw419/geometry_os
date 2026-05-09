; DESCRIPTION: Draws a blue line from (285, 81) to (123, 37).
; PLAN: r0=285(x1), r1=81(y1), r2=123(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 81
LDI r2, 123
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
