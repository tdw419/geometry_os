; DESCRIPTION: Renders a magenta line between points (312, 136) and (154, 200).
; PLAN: r0=312(x1), r1=136(y1), r2=154(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 136
LDI r2, 154
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
