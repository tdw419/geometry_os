; DESCRIPTION: Renders a magenta line between points (506, 139) and (129, 152).
; PLAN: r0=506(x1), r1=139(y1), r2=129(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 139
LDI r2, 129
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
