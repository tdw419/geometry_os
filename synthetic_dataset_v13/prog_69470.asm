; DESCRIPTION: Renders a magenta line between points (393, 114) and (86, 181).
; PLAN: r0=393(x1), r1=114(y1), r2=86(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 114
LDI r2, 86
LDI r3, 181
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
