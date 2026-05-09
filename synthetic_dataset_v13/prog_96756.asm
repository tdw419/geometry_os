; DESCRIPTION: Draws a magenta line from (185, 108) to (322, 235).
; PLAN: r0=185(x1), r1=108(y1), r2=322(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 108
LDI r2, 322
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
