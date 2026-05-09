; DESCRIPTION: Draws a red line from (251, 135) to (278, 219).
; PLAN: r0=251(x1), r1=135(y1), r2=278(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 135
LDI r2, 278
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
