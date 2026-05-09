; DESCRIPTION: Renders a magenta line between points (461, 61) and (151, 30).
; PLAN: r0=461(x1), r1=61(y1), r2=151(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 61
LDI r2, 151
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
