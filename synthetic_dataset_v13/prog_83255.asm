; DESCRIPTION: Draws a blue line from (218, 246) to (312, 7).
; PLAN: r0=218(x1), r1=246(y1), r2=312(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 246
LDI r2, 312
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
