; DESCRIPTION: Renders a magenta line between points (61, 99) and (166, 119).
; PLAN: r0=61(x1), r1=99(y1), r2=166(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 99
LDI r2, 166
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
