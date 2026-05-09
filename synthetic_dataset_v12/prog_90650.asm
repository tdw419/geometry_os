; DESCRIPTION: Draws a black line from (222, 88) to (204, 50).
; PLAN: r0=222(x1), r1=88(y1), r2=204(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 88
LDI r2, 204
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
