; DESCRIPTION: Draws a yellow line from (40, 129) to (105, 227).
; PLAN: r0=40(x1), r1=129(y1), r2=105(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 129
LDI r2, 105
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
