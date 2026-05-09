; DESCRIPTION: Draws a red line from (137, 248) to (267, 84).
; PLAN: r0=137(x1), r1=248(y1), r2=267(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 248
LDI r2, 267
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
