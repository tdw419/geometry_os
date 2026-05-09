; DESCRIPTION: Draws a red line from (104, 132) to (232, 112).
; PLAN: r0=104(x1), r1=132(y1), r2=232(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 132
LDI r2, 232
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
