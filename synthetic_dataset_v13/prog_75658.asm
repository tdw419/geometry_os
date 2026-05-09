; DESCRIPTION: Draws a yellow line from (203, 35) to (400, 232).
; PLAN: r0=203(x1), r1=35(y1), r2=400(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 35
LDI r2, 400
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
