; DESCRIPTION: Draws a yellow line from (102, 108) to (348, 124).
; PLAN: r0=102(x1), r1=108(y1), r2=348(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 108
LDI r2, 348
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
