; DESCRIPTION: Draws a yellow line from (385, 105) to (420, 150).
; PLAN: r0=385(x1), r1=105(y1), r2=420(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 105
LDI r2, 420
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
