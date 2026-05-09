; DESCRIPTION: Draws a yellow line from (310, 86) to (451, 214).
; PLAN: r0=310(x1), r1=86(y1), r2=451(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 86
LDI r2, 451
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
