; DESCRIPTION: Draws a magenta line from (378, 235) to (277, 9).
; PLAN: r0=378(x1), r1=235(y1), r2=277(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 235
LDI r2, 277
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
