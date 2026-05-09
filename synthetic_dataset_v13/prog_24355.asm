; DESCRIPTION: Renders a magenta line between points (72, 237) and (93, 12).
; PLAN: r0=72(x1), r1=237(y1), r2=93(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 237
LDI r2, 93
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
