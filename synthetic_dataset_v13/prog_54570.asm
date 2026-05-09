; DESCRIPTION: Draws a yellow line from (70, 98) to (121, 122).
; PLAN: r0=70(x1), r1=98(y1), r2=121(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 98
LDI r2, 121
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
