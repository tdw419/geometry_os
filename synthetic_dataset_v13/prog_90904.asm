; DESCRIPTION: Draws a white line from (447, 23) to (106, 232).
; PLAN: r0=447(x1), r1=23(y1), r2=106(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 23
LDI r2, 106
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
