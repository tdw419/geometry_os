; DESCRIPTION: Draws a green line from (204, 88) to (181, 80).
; PLAN: r0=204(x1), r1=88(y1), r2=181(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 88
LDI r2, 181
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
