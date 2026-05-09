; DESCRIPTION: Renders a magenta line between points (235, 62) and (441, 197).
; PLAN: r0=235(x1), r1=62(y1), r2=441(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 62
LDI r2, 441
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
