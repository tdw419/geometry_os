; DESCRIPTION: Renders a red line between points (447, 72) and (267, 17).
; PLAN: r0=447(x1), r1=72(y1), r2=267(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 72
LDI r2, 267
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
