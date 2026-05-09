; DESCRIPTION: Draws a yellow line from (341, 141) to (1, 182).
; PLAN: r0=341(x1), r1=141(y1), r2=1(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 141
LDI r2, 1
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
