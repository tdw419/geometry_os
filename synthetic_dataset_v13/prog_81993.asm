; DESCRIPTION: Renders a magenta line between points (212, 40) and (429, 151).
; PLAN: r0=212(x1), r1=40(y1), r2=429(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 40
LDI r2, 429
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
