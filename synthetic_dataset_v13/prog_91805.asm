; DESCRIPTION: Renders a magenta line between points (315, 56) and (33, 151).
; PLAN: r0=315(x1), r1=56(y1), r2=33(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 56
LDI r2, 33
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
