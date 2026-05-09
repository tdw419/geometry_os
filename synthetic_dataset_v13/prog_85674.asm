; DESCRIPTION: Draws a magenta line from (86, 235) to (441, 11).
; PLAN: r0=86(x1), r1=235(y1), r2=441(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 235
LDI r2, 441
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
