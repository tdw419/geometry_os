; DESCRIPTION: Draws a red line from (96, 1) to (17, 179).
; PLAN: r0=96(x1), r1=1(y1), r2=17(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 1
LDI r2, 17
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
