; DESCRIPTION: Draws a red line from (366, 88) to (184, 13).
; PLAN: r0=366(x1), r1=88(y1), r2=184(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 88
LDI r2, 184
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
