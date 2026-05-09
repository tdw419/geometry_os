; DESCRIPTION: Draws a magenta line from (250, 84) to (294, 235).
; PLAN: r0=250(x1), r1=84(y1), r2=294(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 84
LDI r2, 294
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
