; DESCRIPTION: Draws a yellow line from (63, 113) to (455, 230).
; PLAN: r0=63(x1), r1=113(y1), r2=455(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 113
LDI r2, 455
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
