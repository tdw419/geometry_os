; DESCRIPTION: Places a red line segment connecting (100, 29) to (267, 245).
; PLAN: r0=100(x1), r1=29(y1), r2=267(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 29
LDI r2, 267
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
