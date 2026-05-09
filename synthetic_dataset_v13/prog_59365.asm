; DESCRIPTION: Draws a yellow line from (267, 121) to (266, 124).
; PLAN: r0=267(x1), r1=121(y1), r2=266(x2), r3=124(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 121
LDI r2, 266
LDI r3, 124
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
