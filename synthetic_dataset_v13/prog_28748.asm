; DESCRIPTION: Draws a red line from (96, 3) to (43, 113).
; PLAN: r0=96(x1), r1=3(y1), r2=43(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 3
LDI r2, 43
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
