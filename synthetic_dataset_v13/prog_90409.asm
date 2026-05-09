; DESCRIPTION: Draws a green line from (338, 155) to (358, 58).
; PLAN: r0=338(x1), r1=155(y1), r2=358(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 155
LDI r2, 358
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
