; DESCRIPTION: Draws a yellow line from (296, 51) to (55, 170).
; PLAN: r0=296(x1), r1=51(y1), r2=55(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 51
LDI r2, 55
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
