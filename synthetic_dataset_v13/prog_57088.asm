; DESCRIPTION: Renders a magenta line between points (78, 114) and (241, 38).
; PLAN: r0=78(x1), r1=114(y1), r2=241(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 114
LDI r2, 241
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
