; DESCRIPTION: Draws a black line from (6, 217) to (261, 188).
; PLAN: r0=6(x1), r1=217(y1), r2=261(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 217
LDI r2, 261
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
