; DESCRIPTION: Draws a yellow line from (268, 232) to (499, 12).
; PLAN: r0=268(x1), r1=232(y1), r2=499(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 232
LDI r2, 499
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
