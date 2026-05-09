; DESCRIPTION: Draws a red line from (219, 158) to (173, 116).
; PLAN: r0=219(x1), r1=158(y1), r2=173(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 158
LDI r2, 173
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
