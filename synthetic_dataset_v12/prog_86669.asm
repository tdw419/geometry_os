; DESCRIPTION: Draws a yellow line from (431, 18) to (447, 245).
; PLAN: r0=431(x1), r1=18(y1), r2=447(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 18
LDI r2, 447
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
