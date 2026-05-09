; DESCRIPTION: Renders a yellow line between points (61, 0) and (429, 118).
; PLAN: r0=61(x1), r1=0(y1), r2=429(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 0
LDI r2, 429
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
