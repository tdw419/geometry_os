; DESCRIPTION: Renders a magenta line between points (357, 122) and (268, 24).
; PLAN: r0=357(x1), r1=122(y1), r2=268(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 122
LDI r2, 268
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
