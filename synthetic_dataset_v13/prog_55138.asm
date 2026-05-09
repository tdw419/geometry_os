; DESCRIPTION: Draws a yellow line from (106, 4) to (219, 17).
; PLAN: r0=106(x1), r1=4(y1), r2=219(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 4
LDI r2, 219
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
