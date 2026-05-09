; DESCRIPTION: Renders a magenta line between points (468, 185) and (26, 25).
; PLAN: r0=468(x1), r1=185(y1), r2=26(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 185
LDI r2, 26
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
