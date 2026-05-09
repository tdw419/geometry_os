; DESCRIPTION: Draws a magenta line from (326, 235) to (6, 19).
; PLAN: r0=326(x1), r1=235(y1), r2=6(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 235
LDI r2, 6
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
