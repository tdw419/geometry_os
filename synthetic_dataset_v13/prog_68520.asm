; DESCRIPTION: Draws a yellow line from (163, 77) to (293, 184).
; PLAN: r0=163(x1), r1=77(y1), r2=293(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 77
LDI r2, 293
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
