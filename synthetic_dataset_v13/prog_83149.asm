; DESCRIPTION: Draws a yellow line from (37, 219) to (310, 208).
; PLAN: r0=37(x1), r1=219(y1), r2=310(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 219
LDI r2, 310
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
