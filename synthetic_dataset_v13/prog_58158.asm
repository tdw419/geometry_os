; DESCRIPTION: Places a black line segment connecting (267, 199) to (190, 51).
; PLAN: r0=267(x1), r1=199(y1), r2=190(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 199
LDI r2, 190
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
