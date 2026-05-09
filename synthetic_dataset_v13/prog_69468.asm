; DESCRIPTION: Draws a yellow line from (209, 88) to (184, 14).
; PLAN: r0=209(x1), r1=88(y1), r2=184(x2), r3=14(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 88
LDI r2, 184
LDI r3, 14
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
