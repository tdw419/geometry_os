; DESCRIPTION: Draws a yellow line from (43, 51) to (121, 126).
; PLAN: r0=43(x1), r1=51(y1), r2=121(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 51
LDI r2, 121
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
