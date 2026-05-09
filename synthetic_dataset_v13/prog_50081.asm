; DESCRIPTION: Draws a magenta line from (235, 38) to (93, 151).
; PLAN: r0=235(x1), r1=38(y1), r2=93(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 38
LDI r2, 93
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
