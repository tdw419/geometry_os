; DESCRIPTION: Draws a white line from (84, 88) to (189, 191).
; PLAN: r0=84(x1), r1=88(y1), r2=189(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 88
LDI r2, 189
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
