; DESCRIPTION: Renders a magenta line between points (220, 21) and (355, 217).
; PLAN: r0=220(x1), r1=21(y1), r2=355(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 21
LDI r2, 355
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
