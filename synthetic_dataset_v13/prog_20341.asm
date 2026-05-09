; DESCRIPTION: Renders a magenta line between points (28, 14) and (373, 153).
; PLAN: r0=28(x1), r1=14(y1), r2=373(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 14
LDI r2, 373
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
