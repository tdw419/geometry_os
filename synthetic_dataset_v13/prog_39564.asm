; DESCRIPTION: Draws a yellow line from (334, 54) to (376, 43).
; PLAN: r0=334(x1), r1=54(y1), r2=376(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 54
LDI r2, 376
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
