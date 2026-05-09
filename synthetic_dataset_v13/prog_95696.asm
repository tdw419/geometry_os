; DESCRIPTION: Renders a magenta line between points (61, 57) and (130, 251).
; PLAN: r0=61(x1), r1=57(y1), r2=130(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 57
LDI r2, 130
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
