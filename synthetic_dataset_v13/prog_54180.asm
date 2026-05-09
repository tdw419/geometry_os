; DESCRIPTION: Renders a magenta line between points (129, 6) and (165, 101).
; PLAN: r0=129(x1), r1=6(y1), r2=165(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 6
LDI r2, 165
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
