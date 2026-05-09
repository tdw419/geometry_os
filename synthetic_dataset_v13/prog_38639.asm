; DESCRIPTION: Renders a magenta line between points (504, 29) and (190, 90).
; PLAN: r0=504(x1), r1=29(y1), r2=190(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 29
LDI r2, 190
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
