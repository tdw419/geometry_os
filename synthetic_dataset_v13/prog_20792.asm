; DESCRIPTION: Renders a magenta line between points (382, 33) and (355, 147).
; PLAN: r0=382(x1), r1=33(y1), r2=355(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 33
LDI r2, 355
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
