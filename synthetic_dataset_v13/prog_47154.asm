; DESCRIPTION: Draws a yellow line from (455, 43) to (505, 180).
; PLAN: r0=455(x1), r1=43(y1), r2=505(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 43
LDI r2, 505
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
