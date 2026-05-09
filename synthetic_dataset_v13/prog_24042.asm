; DESCRIPTION: Renders a magenta line between points (382, 245) and (49, 199).
; PLAN: r0=382(x1), r1=245(y1), r2=49(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 245
LDI r2, 49
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
