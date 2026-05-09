; DESCRIPTION: Draws a magenta line from (425, 235) to (470, 1).
; PLAN: r0=425(x1), r1=235(y1), r2=470(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 235
LDI r2, 470
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
