; DESCRIPTION: Places a white line segment connecting (233, 145) to (267, 233).
; PLAN: r0=233(x1), r1=145(y1), r2=267(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 145
LDI r2, 267
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
