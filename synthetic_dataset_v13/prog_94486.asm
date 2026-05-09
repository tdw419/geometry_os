; DESCRIPTION: Places a white line segment connecting (399, 131) to (267, 71).
; PLAN: r0=399(x1), r1=131(y1), r2=267(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 131
LDI r2, 267
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
