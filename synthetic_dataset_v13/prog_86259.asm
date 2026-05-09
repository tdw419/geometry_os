; DESCRIPTION: Renders a magenta line between points (457, 43) and (429, 190).
; PLAN: r0=457(x1), r1=43(y1), r2=429(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 43
LDI r2, 429
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
