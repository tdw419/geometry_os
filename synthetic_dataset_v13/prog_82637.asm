; DESCRIPTION: Renders a magenta line between points (420, 145) and (26, 249).
; PLAN: r0=420(x1), r1=145(y1), r2=26(x2), r3=249(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 145
LDI r2, 26
LDI r3, 249
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
