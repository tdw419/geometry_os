; DESCRIPTION: Draws a yellow line from (254, 139) to (61, 101).
; PLAN: r0=254(x1), r1=139(y1), r2=61(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 139
LDI r2, 61
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
