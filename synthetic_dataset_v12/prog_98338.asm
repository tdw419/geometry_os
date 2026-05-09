; DESCRIPTION: Renders a magenta line between points (169, 76) and (435, 190).
; PLAN: r0=169(x1), r1=76(y1), r2=435(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 76
LDI r2, 435
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
