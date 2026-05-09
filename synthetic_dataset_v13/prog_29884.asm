; DESCRIPTION: Renders a magenta line between points (234, 140) and (289, 147).
; PLAN: r0=234(x1), r1=140(y1), r2=289(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 140
LDI r2, 289
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
