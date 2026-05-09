; DESCRIPTION: Renders a magenta line between points (29, 61) and (291, 251).
; PLAN: r0=29(x1), r1=61(y1), r2=291(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 61
LDI r2, 291
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
