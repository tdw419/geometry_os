; DESCRIPTION: Draws a magenta line from (235, 18) to (31, 75).
; PLAN: r0=235(x1), r1=18(y1), r2=31(x2), r3=75(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 18
LDI r2, 31
LDI r3, 75
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
