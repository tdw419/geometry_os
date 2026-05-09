; DESCRIPTION: Draws a red line from (289, 103) to (73, 203).
; PLAN: r0=289(x1), r1=103(y1), r2=73(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 103
LDI r2, 73
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
