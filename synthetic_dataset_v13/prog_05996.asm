; DESCRIPTION: Draws a yellow line from (451, 130) to (86, 105).
; PLAN: r0=451(x1), r1=130(y1), r2=86(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 130
LDI r2, 86
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
