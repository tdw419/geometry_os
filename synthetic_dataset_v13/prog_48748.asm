; DESCRIPTION: Renders a magenta line between points (212, 26) and (6, 8).
; PLAN: r0=212(x1), r1=26(y1), r2=6(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 26
LDI r2, 6
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
