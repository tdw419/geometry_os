; DESCRIPTION: Renders a magenta line between points (494, 142) and (452, 97).
; PLAN: r0=494(x1), r1=142(y1), r2=452(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 142
LDI r2, 452
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
