; DESCRIPTION: Draws a yellow line from (143, 88) to (332, 1).
; PLAN: r0=143(x1), r1=88(y1), r2=332(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 88
LDI r2, 332
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
