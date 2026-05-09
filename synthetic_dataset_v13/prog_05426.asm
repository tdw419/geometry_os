; DESCRIPTION: Draws a blue line from (426, 17) to (420, 159).
; PLAN: r0=426(x1), r1=17(y1), r2=420(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 17
LDI r2, 420
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
