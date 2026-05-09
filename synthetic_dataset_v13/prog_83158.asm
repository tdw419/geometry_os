; DESCRIPTION: Draws a black line from (230, 218) to (246, 252).
; PLAN: r0=230(x1), r1=218(y1), r2=246(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 218
LDI r2, 246
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
