; DESCRIPTION: Renders a magenta line between points (193, 15) and (435, 151).
; PLAN: r0=193(x1), r1=15(y1), r2=435(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 15
LDI r2, 435
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
