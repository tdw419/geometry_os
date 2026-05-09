; DESCRIPTION: Draws a red line from (342, 147) to (182, 219).
; PLAN: r0=342(x1), r1=147(y1), r2=182(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 147
LDI r2, 182
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
