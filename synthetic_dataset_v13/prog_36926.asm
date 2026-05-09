; DESCRIPTION: Draws a yellow line from (347, 233) to (123, 8).
; PLAN: r0=347(x1), r1=233(y1), r2=123(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 233
LDI r2, 123
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
