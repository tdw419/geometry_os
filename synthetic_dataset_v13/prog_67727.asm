; DESCRIPTION: Renders a magenta line between points (219, 226) and (246, 151).
; PLAN: r0=219(x1), r1=226(y1), r2=246(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 226
LDI r2, 246
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
