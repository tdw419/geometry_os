; DESCRIPTION: Draws a red line from (384, 77) to (285, 194).
; PLAN: r0=384(x1), r1=77(y1), r2=285(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 77
LDI r2, 285
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
