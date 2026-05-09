; DESCRIPTION: Draws a yellow line from (285, 23) to (210, 155).
; PLAN: r0=285(x1), r1=23(y1), r2=210(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 23
LDI r2, 210
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
