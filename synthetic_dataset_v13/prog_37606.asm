; DESCRIPTION: Draws a magenta line from (396, 53) to (235, 197).
; PLAN: r0=396(x1), r1=53(y1), r2=235(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 53
LDI r2, 235
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
