; DESCRIPTION: Places a magenta line segment connecting (51, 235) to (381, 122).
; PLAN: r0=51(x1), r1=235(y1), r2=381(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 235
LDI r2, 381
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
