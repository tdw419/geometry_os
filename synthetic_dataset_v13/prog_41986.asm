; DESCRIPTION: Draws a yellow line from (506, 121) to (194, 182).
; PLAN: r0=506(x1), r1=121(y1), r2=194(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 121
LDI r2, 194
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
