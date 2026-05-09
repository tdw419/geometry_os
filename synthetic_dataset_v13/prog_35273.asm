; DESCRIPTION: Renders a magenta line between points (440, 185) and (351, 87).
; PLAN: r0=440(x1), r1=185(y1), r2=351(x2), r3=87(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 185
LDI r2, 351
LDI r3, 87
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
