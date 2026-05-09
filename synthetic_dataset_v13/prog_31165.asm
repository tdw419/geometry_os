; DESCRIPTION: Renders a magenta line between points (28, 96) and (429, 158).
; PLAN: r0=28(x1), r1=96(y1), r2=429(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 96
LDI r2, 429
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
