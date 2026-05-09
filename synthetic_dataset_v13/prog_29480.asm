; DESCRIPTION: Draws a magenta line from (225, 0) to (29, 235).
; PLAN: r0=225(x1), r1=0(y1), r2=29(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 0
LDI r2, 29
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
