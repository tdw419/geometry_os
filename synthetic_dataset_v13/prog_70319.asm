; DESCRIPTION: Draws a red line from (267, 5) to (104, 247).
; PLAN: r0=267(x1), r1=5(y1), r2=104(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 5
LDI r2, 104
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
