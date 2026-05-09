; DESCRIPTION: Draws a red line from (77, 52) to (354, 52).
; PLAN: r0=77(x1), r1=52(y1), r2=354(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 52
LDI r2, 354
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
