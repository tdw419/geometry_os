; DESCRIPTION: Draws a black line from (338, 217) to (66, 198).
; PLAN: r0=338(x1), r1=217(y1), r2=66(x2), r3=198(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 217
LDI r2, 66
LDI r3, 198
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
