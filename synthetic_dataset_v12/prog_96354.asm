; DESCRIPTION: Draws a white line from (258, 112) to (338, 163).
; PLAN: r0=258(x1), r1=112(y1), r2=338(x2), r3=163(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 112
LDI r2, 338
LDI r3, 163
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
