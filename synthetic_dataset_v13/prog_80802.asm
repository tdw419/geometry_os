; DESCRIPTION: Places a black line segment connecting (267, 172) to (338, 31).
; PLAN: r0=267(x1), r1=172(y1), r2=338(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 172
LDI r2, 338
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
