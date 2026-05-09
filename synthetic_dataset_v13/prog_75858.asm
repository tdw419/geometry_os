; DESCRIPTION: Draws a black line from (115, 88) to (343, 74).
; PLAN: r0=115(x1), r1=88(y1), r2=343(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 88
LDI r2, 343
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
