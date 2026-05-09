; DESCRIPTION: Draws a black line from (77, 232) to (124, 61).
; PLAN: r0=77(x1), r1=232(y1), r2=124(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 232
LDI r2, 124
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
