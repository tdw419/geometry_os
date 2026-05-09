; DESCRIPTION: Renders a magenta line between points (486, 60) and (142, 2).
; PLAN: r0=486(x1), r1=60(y1), r2=142(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 60
LDI r2, 142
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
