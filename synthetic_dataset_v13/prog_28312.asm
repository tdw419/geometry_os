; DESCRIPTION: Renders a magenta line between points (354, 174) and (484, 101).
; PLAN: r0=354(x1), r1=174(y1), r2=484(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 174
LDI r2, 484
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
