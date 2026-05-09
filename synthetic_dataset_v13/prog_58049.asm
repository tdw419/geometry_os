; DESCRIPTION: Renders a magenta line between points (274, 0) and (233, 117).
; PLAN: r0=274(x1), r1=0(y1), r2=233(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 0
LDI r2, 233
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
