; DESCRIPTION: Draws a yellow line from (395, 121) to (241, 24).
; PLAN: r0=395(x1), r1=121(y1), r2=241(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 121
LDI r2, 241
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
