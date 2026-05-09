; DESCRIPTION: Renders a magenta line between points (140, 57) and (325, 17).
; PLAN: r0=140(x1), r1=57(y1), r2=325(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 57
LDI r2, 325
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
