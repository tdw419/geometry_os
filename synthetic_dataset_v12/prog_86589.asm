; DESCRIPTION: Draws a white line from (279, 148) to (348, 227).
; PLAN: r0=279(x1), r1=148(y1), r2=348(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 148
LDI r2, 348
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
