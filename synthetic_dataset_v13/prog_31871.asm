; DESCRIPTION: Renders a yellow line between points (463, 198) and (307, 105).
; PLAN: r0=463(x1), r1=198(y1), r2=307(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 198
LDI r2, 307
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
