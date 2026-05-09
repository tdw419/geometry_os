; DESCRIPTION: Draws a magenta line from (235, 114) to (221, 51).
; PLAN: r0=235(x1), r1=114(y1), r2=221(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 114
LDI r2, 221
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
