; DESCRIPTION: Draws a red line from (444, 14) to (96, 88).
; PLAN: r0=444(x1), r1=14(y1), r2=96(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 14
LDI r2, 96
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
