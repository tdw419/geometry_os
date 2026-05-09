; DESCRIPTION: Renders a magenta line between points (457, 63) and (355, 56).
; PLAN: r0=457(x1), r1=63(y1), r2=355(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 63
LDI r2, 355
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
