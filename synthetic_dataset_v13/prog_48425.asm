; DESCRIPTION: Draws a green line from (375, 88) to (36, 101).
; PLAN: r0=375(x1), r1=88(y1), r2=36(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 88
LDI r2, 36
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
