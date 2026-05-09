; DESCRIPTION: Renders a magenta line between points (312, 187) and (76, 23).
; PLAN: r0=312(x1), r1=187(y1), r2=76(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 187
LDI r2, 76
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
