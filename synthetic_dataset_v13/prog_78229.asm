; DESCRIPTION: Draws a yellow line from (503, 248) to (472, 138).
; PLAN: r0=503(x1), r1=248(y1), r2=472(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 248
LDI r2, 472
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
