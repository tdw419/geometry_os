; DESCRIPTION: Draws a blue line from (213, 125) to (101, 17).
; PLAN: r0=213(x1), r1=125(y1), r2=101(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 125
LDI r2, 101
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
