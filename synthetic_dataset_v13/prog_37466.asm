; DESCRIPTION: Draws a blue line from (286, 105) to (345, 232).
; PLAN: r0=286(x1), r1=105(y1), r2=345(x2), r3=232(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 105
LDI r2, 345
LDI r3, 232
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
