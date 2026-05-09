; DESCRIPTION: Renders a magenta line between points (483, 188) and (122, 156).
; PLAN: r0=483(x1), r1=188(y1), r2=122(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 188
LDI r2, 122
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
