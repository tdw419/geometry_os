; DESCRIPTION: Renders a magenta line between points (130, 2) and (231, 165).
; PLAN: r0=130(x1), r1=2(y1), r2=231(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 2
LDI r2, 231
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
