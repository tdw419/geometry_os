; DESCRIPTION: Renders a blue line between points (162, 42) and (190, 138).
; PLAN: r0=162(x1), r1=42(y1), r2=190(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 42
LDI r2, 190
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
