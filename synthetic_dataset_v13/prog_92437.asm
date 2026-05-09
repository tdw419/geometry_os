; DESCRIPTION: Draws a black line from (83, 246) to (113, 248).
; PLAN: r0=83(x1), r1=246(y1), r2=113(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 246
LDI r2, 113
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
